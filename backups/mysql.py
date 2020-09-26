"""
Backups mysql databases and server

Usage:
  backups ls                    [--file FILE] [--verbose]
  backups show NAME             [--file FILE] [--verbose]
  backups databases NAME        [--file FILE] [--verbose]
  backups run NAME              [--file FILE] [--verbose] [--dryrun]
  backups run NAME [DATABASE]   [--file FILE] [--verbose] [--dryrun]

Commands:
  ls          Prints the backups names
  show        Prints the configuration for a named backup
  databases   Lists all databases on a name backup server
  run         Runs the backup for a config

Options:
  -f --file FILE    The backups config file [default: /etc/backups/backups.yaml]
  -d --dryrun       Just prints the commands but doesn't execute them
  -v --verbose      Adds verbosity
  -h --help         Prints this help
     --version      Prints the current version

Environment variables:
  BACKUPS_FILE          Use this file instead of /etc/backups/backups.yaml
  BACKUPS_DUMPS_DIR     Use this directory instead of /tmp/backups
  BACKUPS_MYSQLDUMP     Use this binary instead of mysqldump from the $PATH


Check https://github.com/ptdorf/backups#backups for more info

"""
import os
import sys
import time
import yaml
import argparse
import MySQLdb
from docopt import docopt


DUMPS_DIR   = "/tmp/backups"
CONFIG_DIR  = "/etc/backups"
CONFIG_NAME = "backups"

# logging.basicConfig(
#   level=logging.INFO,
#   format="%(asctime)s  %(message)s"
# )

def logging_info(message):
    now = time.strftime("%Y-%m-%d %H:%M:%S")
    print("\033[38;5;242m%s\033[0m  %s" %(now, message))

def __logging_debug(message):
    # print(message)
    pass


class Mysql:

  def __init__(self, config):
    self.config = config

    args = {
      "host":   self.config["host"],
      "user":   self.config["username"],
      "passwd": self.config["password"],
    }

    if self.config.get("database") is not None:
      args["db"] = self.config["database"]

    self.connection = MySQLdb.connect(**args)


  def query(self, sql, params={}):
    cursor = self.connection.cursor()
    cursor.execute(sql, params)
    cols = [col[0] for col in cursor.description]
    rows = [dict(zip(cols, row)) for row in cursor.fetchall()]
    cursor.close()

    return rows


class Backups:

  def __init__(self, file):
    self.file = file
    # self.dryrun = dryrun
    exit(55)

    if not os.path.isfile(self.file):
      raise RuntimeError(f"File '{self.file}' doesn't exist.")

    with open(self.file, "r") as f:
      self.data = yaml.safe_load(f)

    if not "backups" in self.data.keys():
      raise RuntimeError(f"File '{self.file}' doesn't have a backups top key.")

    self.config = self.data["backups"]


  def load(self, name):
    self.name = name
    if not self.name in self.config.keys():
      raise RuntimeError(f"Backup configuration '{self.name}' doesn't exist.")

    self.current = self.config[self.name]
    self.options = self.current.get("options", {})
    self.mysql   = Mysql(self.current["connection"])


  def ls(self):
    for name in self.config:
      print(name)


  def dump(self):
    print(yaml.dump(self.data))


  def show(self, name):
    self.load(name)
    print(yaml.dump(self.current))


  def databases(self, name):
    self.load(name)
    rows = self.mysql.query("SHOW DATABASES")
    for i in rows:
      print(i["Database"])


  def run(self, name, database):
    self.load(name)
    self.prepare(name, database)

    if database is None:
      database = self.options.get("database")

    if database:
      self.dump_database(database)
    elif self.options.get("server", False) == True:
      self.dump_server()
    else:
      self.dump_databases()

    self.compress()
    self.upload()
    self.cleanup()


  def prepare(self, name, database=None):
    slug_date = time.strftime("%Y/%m/%d")
    slug_time = time.strftime("%Y-%m-%d-%H%M%S")
    slug_job  = name

    if database:
      slug_job = name + "-" + database

    self.dump_dir = f"{DUMPS_DIR}/{slug_job}/{slug_date}/{slug_time}"
    self.zip_file = f"{self.dump_dir}.zip"

    logging_info(f"Using dir \033[32;1m{self.dump_dir}\033[0m")
    self.exec("mkdir -p %s" % (self.dump_dir))


  def dump_server(self):
    logging_info("Dumping the server into a single file")
    cmd = "/usr/local/opt/mysql-client@5.7/bin/mysqldump --host=%s --user=%s --password=%s --master-data=%i --single-transaction --all-databases > %s 2>%s" % \
      (
        self.current["connection"].get("host", ""),
        self.current["connection"].get("username", ""),
        self.current["connection"].get("password", ""),
        self.options.get("master-data", 1),
        "%s/%s%s.sql" % (self.dump_dir, self.options.get("prefix", ""), "all-databases"),
        self.options.get("errors", "/dev/null")
      )
    self.exec(cmd)



  def dump_databases(self):
    logging_info("Dumping databases into individual files")
    rows = self.mysql.query("SELECT SCHEMA_NAME db FROM information_schema.SCHEMATA")
    for row in rows:
      db = row["db"]
      if db == "information_schema":
        continue
      if db == "performance_schema":
        continue

      self.dump_database(db)


  def dump_database(self, database):
    logging_info(f"Dumping database \033[32;1m{database}\033[0m")
    command = "/usr/local/opt/mysql-client@5.7/bin/mysqldump --host=%s --user=%s --password=%s --master-data=%i --single-transaction --databases %s > %s 2>%s" % \
      (
        self.current["connection"].get("host", ""),
        self.current["connection"].get("username", ""),
        self.current["connection"].get("password", ""),
        self.options.get("master-data", 1),
        database,
        "%s/%s%s.sql" % (self.dump_dir, self.options.get("prefix", ""), database),
        self.options.get("errors", "/dev/null")
      )
    self.exec(command)


  def exec(self, cmd):
    logging_info(f"\033[38;5;242mRunning '{cmd}'\033[0m")
    if self.dryrun:
      return

    # code = os.system(cmd)
    # if code != 0:
    #   raise RuntimeError(f"Command '\033[31;1m{cmd}\033[0m' failed.")


  def compress(self):
    logging_info(f"Compressing \033[32;1m{self.dump_dir}\033[0m")
    password = self.options.get("encryption").get("password", "biteme")
    cmd = "cd %s && zip --password %s -r %s %s >%s" % (
      os.path.dirname(self.dump_dir),
      password,
      self.zip_file,
      os.path.basename(self.dump_dir),
      self.options.get("errors", "/dev/null")
    )
    self.exec(cmd)


  # def rm_dir(self, start, stop):
  #   while start != stop:
  #     self.run("rmdir %s" % (start))
  #     start = os.path.dirname(start)

  def cleanup(self):
    logging_info(f"Cleaning \033[32;1m{self.dump_dir}\033[0m")
    self.exec(f"rm -fr {self.dump_dir}")
    # self.run("rm %s"           % (self.zipfile))
    # self.rm_dir(self.updir, self.BACKUPS_DIR)


  def upload(self):
    self.s3 = self.current.get("upload", {}).get("s3")
    if self.s3 is None:
      logging_info("Skipping uploading")
      return

    s3_dir    = os.path.dirname(self.zip_file)
    s3_dir    = s3_dir.replace("/tmp/backups/", "")
    s3_name   = os.path.basename(self.zip_file)
    s3_bucket = self.s3.get("bucket")
    s3_path   = self.s3.get("path")
    s3_path   = s3path.replace("<suffix>", self.name)
    s3_folder = "s3://%s/%s/%s" % (s3_bucket, s3_path, s3_dir)

    self.s3_file = "%s/%s" % (s3_folder, s3_name)

    # logging_info("Uploading to %s" % (self.s3file))
    logging_info("Uploading")
    cmd = "aws s3 cp %s %s/ >%s" % (self.zip_file, s3_folder, self.options.get("errors", "/dev/null"))
    self.exec(cmd)

    # self.size     = self.read_size(os.path.getsize(self.zipfile))
    # command       = "aws s3 ls %s" % (self.s3file)
    # self.uploaded = self.out(command).strip()
    # # logging_info("Checking upload %s" % (output))
    # logging_info("Checking")

    # return {
    #   "Name"     : "%s" % (self.name),
    #   "File"     : self.zipfile,
    #   "S3 file"  : "<%s|%s>" % (s3view, self.s3file),
    #   "Size"     : self.size,
    #   # "Upload"   : "%s" % (output),
    # }


if __name__ == "__main__":
  args = docopt(__doc__, version="0.2.0")
  if args["--verbose"]:
    for k, v in args.items():
      print(f"\033[38;5;242m{k}: {v}\033[0m")

  backups = Backups(args['--file'], args['--dryrun'])

  if args["ls"]:
    backups.ls()

  elif args["show"]:
    backups.show(args["NAME"])

  elif args["databases"]:
    backups.databases(args["NAME"])

  elif args["run"]:
    backups.run(args["NAME"], args["DATABASE"])

  exit()
