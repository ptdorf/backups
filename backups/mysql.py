import os
import sys
import time
import yaml
import MySQLdb
# import logging
# import .logging


# logging.basicConfig(
#   level=logging.INFO,
#   format='%(asctime)s  %(message)s'
# )

def logging_info(message):
    now = time.strftime("%Y-%m-%d %H:%M:%S")
    print("%s  %s" %(now, message))

def logging_debug(message):
    # print(message)
    pass


class Mysql:
  def __init__(self, config):
    self.config     = config
    self.host       = self.config.get('host', 'localhost')
    self.username   = self.config.get('username', '')
    self.password   = self.config.get('password', '')
    self.database   = self.config.get('database', '')
    self.connection = False

    try:
      self.connection = MySQLdb.connect(self.host, self.username, self.password);
    except MySQLdb.Error, e:
      raise Exception("Error %d: %s." % (e.args[0], e.args[1]))

  def query(self, sql, params={}):
    curs = self.connection.cursor(MySQLdb.cursors.DictCursor)
    curs.execute(sql, params)
    return curs.fetchall()


class Backups:

  BACKUPS_DIR    = '/tmp/backups'
  BACKUPS_CONFIG = '/etc/backups/backups.yaml'

  def __init__(self, name):
    location = os.environ.get('BACKUPS_CONFIG', self.BACKUPS_CONFIG)

    if not os.path.isfile(location):
      raise RuntimeError("Config file '%s' doesn't exist." % (location))

    backups = open(location)
    configs = yaml.load(backups)
    backups.close()

    if not name in configs['backups'].keys():
      raise RuntimeError("Backup configuration '%s' doesn't exist." % (name))

    self.name    = name
    self.config  = configs['backups'][name]
    self.conn    = self.config.get('connection', {})
    self.options = self.config.get('options',    {})
    self.s3      = self.config.get('s3',         {})
    self.monitor = self.config.get('monitor',    {})
    self.mysql   = Mysql(self.conn)

  def run(self, command):
    logging_debug("Running %s" % (command))
    code = os.system(command)
    if code != 0:
      raise RuntimeError("Command '%s' failed." % (command))

  def out(self, command):
    file = os.popen(command)
    out  = file.read()
    file.close()

    return out

  def prepare(self, db=None):
    self.timestamp = time.strftime('%Y-%m-%d-%Hh%Mm%S')
    self.timepath  = time.strftime('%Y/%m/%d')
    self.db        = self.name

    if db:
      self.db = db

    self.jobdir  = '%s/%s'    % (self.BACKUPS_DIR, self.name)
    self.namedir = '%s-%s'    % (self.db, self.timestamp)
    self.tempdir = '%s/%s/%s' % (self.jobdir, self.timepath, self.namedir)
    self.updir   = os.path.dirname(self.tempdir)
    self.zipfile = '%s.zip'   % (self.tempdir)

    self.run('mkdir -p %s' % (self.tempdir))
    # logging_info('Started %s' % (self.tempdir))
    logging_info('Started')

  def backup(self, db=None):
    self.prepare(db)

    logging_info('Dumping')
    if db:
      logging_debug('Dumping the database %s' % (db))
      self.dump_database(db)
    elif self.options.get('server', False) == True:
      self.dump_server()
    else:
      self.dump_databases()

    self.compress()
    upload = self.upload()
    self.cleanup()

    logging_info("Done")
    logging_info("")
    logging_info("(%s) %s" % (self.size, self.s3file))
    return upload

  def dump_server(self):
    logging_debug('Dumping all databases')
    command = 'mysqldump --host=%s --user=%s --password=%s --master-data=%i --single-transaction --all-databases > %s 2>%s' % \
      (
        self.conn.get('host', ''),
        self.conn.get('username', ''),
        self.conn.get('password', ''),
        self.options.get('master-data', 1),
        '%s/%s%s.sql' % (self.tempdir, self.options.get('prefix', ''), 'all-databases'),
        self.options.get('errors', '/dev/null')
      )
    self.run(command)

  def dump_databases(self):
    logging_debug('Dumping individual databases')
    rows = self.mysql.query('SELECT SCHEMA_NAME db FROM information_schema.SCHEMATA')
    for row in rows:
      db = row['db']
      if db == 'information_schema':
        continue

      self.dump_database(db)

  def dump_database(self, database):
    logging_debug('Dumping database %s' % (database))
    command = 'mysqldump --host=%s --user=%s --password=%s --master-data=%i --single-transaction --databases %s > %s 2>%s' % \
      (
        self.conn.get('host', ''),
        self.conn.get('username', ''),
        self.conn.get('password', ''),
        self.options.get('master-data', 1),
        database,
        '%s/%s%s.sql' % (self.tempdir, self.options.get('prefix', ''), database),
        self.options.get('errors', '/dev/null')
      )
    self.run(command)

  def tarzip(self):
    command = 'cd %s && tar zcf %s %s' % (self.jobdir, self.zipfile, self.namedir)
    self.do(command)

  def compress(self):
    # logging_info('Compressing %s' % (self.zipfile))
    logging_info('Compressing')
    command = 'cd %s && zip --password %s -r %s %s >%s' % (
      self.updir,
      self.options.get('encryption', 'biteme'),
      self.zipfile,
      self.namedir,
      self.options.get('errors', '/dev/null')
    )
    self.run(command)

  def upload(self):
    s3base   = os.path.basename(self.zipfile)
    s3region = self.s3.get('region', 'eu-west-1')
    s3bucket = self.s3.get('bucket')
    s3path   = self.s3.get('path')
    s3path   = self.s3.get('path')
    s3path   = s3path.replace('<suffix>', self.name)
    s3view   = 'https://console.aws.amazon.com/s3/home?region=%s&bucket=%s&prefix=%s/%s/' % (s3region, s3bucket, s3path, self.timepath)
    s3folder = 's3://%s/%s/%s' % (s3bucket, s3path, self.timepath)

    self.s3file = '%s/%s' % (s3folder, s3base)

    # logging_info('Uploading to %s' % (self.s3file))
    logging_info('Uploading')
    command = 'aws s3 cp %s %s/ >%s' % (self.zipfile, s3folder, self.options.get('errors', '/dev/null'))
    self.run(command)

    self.size     = self.read_size(os.path.getsize(self.zipfile))
    command       = 'aws s3 ls %s' % (self.s3file)
    self.uploaded = self.out(command).strip()
    # logging_info('Checking upload %s' % (output))
    logging_info('Checking')

    return {
      'Name'     : "%s" % (self.name),
      'File'     : self.zipfile,
      'S3 file'  : '<%s|%s>' % (s3view, self.s3file),
      'Size'     : self.size,
      # 'Upload'   : '%s' % (output),
    }

  def read_size(self, bytes, suffix='B'):
    for unit in ['','K','M','G','T','P','E','Z']:
        if abs(bytes) < 1024.0:
            return "%3.1f %s%s" % (bytes, unit, suffix)
        bytes /= 1024.0
    return "%.1f %s%s" % (bytes, 'Y', suffix)

  def rm_dir(self, start, stop):
    while start != stop:
      self.run('rmdir %s' % (start))
      start = os.path.dirname(start)

  def redact(self, message):
    password = self.conn.get('password', '')
    redacted = str(message).replace(password, 'X')
    return redacted

  def cleanup(self):
    # logging_info('Cleaning %s' % (self.jobdir))
    logging_info('Cleaning')
    self.run('rm -fr %s'       % (self.tempdir))
    self.run('rm %s'           % (self.zipfile))
    self.rm_dir(self.updir, self.BACKUPS_DIR)

  def extras(self, upload):
    return ";;".join(["%s==%s" % (k, v) for k, v in upload.iteritems()])


def main():
  try:
    name = sys.argv[1]
    db   = sys.argv[2] if len(sys.argv) > 2 else None
    msg = '"MySQL backup started" "@user==backup-mysql;;Name==%s"' % (name)
    os.system('notify-slack send "#system-backups" %s' %msg)
    backups = Backups(name)
    upload = backups.backup(db)
    info   = backups.extras(upload)

    msg = '"MySQL backup completed" "@user==backup-mysql;;_color==good;;%s"' % (info)
    os.system('notify-slack send "#system-backups" %s'  % (msg))

  except Exception as e:
    err = backups.redact(e)
    msg = '"MySQL backup failed" "@user==backup-mysql;;_color==danger;;Name==%s;;Error==%s"' % (name, err)
    os.system('notify-slack send "#system-backups" %s'  % (msg))
    os.system('notify-slack send "#system-critical" %s' % (msg))
    exit('Error: %s' % (err))


if __name__ == '__main__':
  if len(sys.argv) < 2:
    exit('Usage: $0 <data-source> [<database>]')

  main()
