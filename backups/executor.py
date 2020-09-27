import os
import time
import yaml
import json
import logger
import requests
from mysql import Mysql


BACKUPS_FILE        = os.environ.get("BACKUPS_FILE", "/etc/backups/backups.yaml")
BACKUPS_DUMPS_DIR   = os.environ.get("BACKUPS_DUMPS_DIR", "/tmp/backups")
BACKUPS_MYSQLDUMP   = os.environ.get("BACKUPS_MYSQLDUMP", "mysqldump")
BACKUPS_LOG_LEVEL   = os.environ.get("BACKUPS_LOG_LEVEL", "INFO")
BACKUPS_STDERR_FILE = os.environ.get("BACKUPS_STDERR_FILE", "/tmp/backups.err")


class Executor:

  def __init__(self, file, dryrun):
    self.file = file
    self.dryrun = dryrun

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

    if database:
      self.dump_database(database)
    elif self.options.get("server", False) == True:
      self.dump_server()
    else:
      databases = self.options.get("databases")
      self.dump_databases(databases)

    self.compress()
    self.upload()
    self.cleanup()
    self.notify()

    size = os.path.getsize(self.zip_file)
    human = self.read_size(size)
    return {
      "dir":  self.dump_dir,
      "zip":  self.zip_file,
      "size": {
        "bytes": size,
        "human": human,
      }
    }


  def read_size(self, bytes, suffix="B"):
    for unit in ["","K","M","G","T","P","E","Z"]:
        if abs(bytes) < 1024.0:
            return "%3.1f %s%s" % (bytes, unit, suffix)
        bytes /= 1024.0
    return "%.1f %s%s" % (bytes, "Y", suffix)



  def prepare(self, name, database=None):
    slug_date = time.strftime("%Y/%m/%d")
    slug_time = time.strftime("%Y-%m-%d-%H%M%S")
    slug_job  = name

    if database:
      slug_job = name + "-" + database

    self.dump_dir = f"{BACKUPS_DUMPS_DIR}/{slug_job}/{slug_date}/{slug_time}"
    self.zip_file = f"{self.dump_dir}.zip"

    logger.info(f"Using dir \033[32;1m{self.dump_dir}\033[0m")
    self.exec("mkdir -p %s" % (self.dump_dir))


  def dump_server(self):
    logger.info("Dumping the server into a single file")
    cmd = "/usr/local/opt/mysql-client@5.7/bin/mysqldump --host=%s --user=%s --password=%s --master-data=%i --single-transaction --all-databases > %s 2>%s" % \
      (
        self.current["connection"].get("host", ""),
        self.current["connection"].get("username", ""),
        self.current["connection"].get("password", ""),
        self.options.get("master-data", 1),
        "%s/%s%s.sql" % (self.dump_dir, self.options.get("prefix", ""), "all-databases"),
        self.options.get("errors", "/tmp/backups/errors.log")
      )
    self.exec(cmd)



  def dump_databases(self, databases):
    logger.info("Dumping individual databases")

    if databases is None:
      databases = []
      rows = self.mysql.query("SELECT SCHEMA_NAME db FROM information_schema.SCHEMATA")
      for row in rows:
        db = row["db"]
        if db == "information_schema":
          continue
        if db == "performance_schema":
          continue
        databases.append(db)

    for database in databases:
      self.dump_database(database)


  def dump_database(self, database):
    logger.info(f"Dumping database \033[32;1m{database}\033[0m")
    command = "/usr/local/opt/mysql-client@5.7/bin/mysqldump --host=%s --user=%s --password=%s --master-data=%i --single-transaction --databases %s > %s 2>%s" % \
      (
        self.current["connection"].get("host", ""),
        self.current["connection"].get("username", ""),
        self.current["connection"].get("password", ""),
        self.options.get("master-data", 1),
        database,
        "%s/%s%s.sql" % (self.dump_dir, self.options.get("prefix", ""), database),
        self.options.get("errors", "/tmp/backups/errors.log")
      )
    self.exec(command)


  def exec(self, cmd):
    logger.info(f"\033[38;5;242mRunning '{cmd}'\033[0m")
    if self.dryrun:
      return

    code = os.system(cmd)
    if code != 0:
      raise RuntimeError(f"Command '\033[31;1m{cmd}\033[0m' failed.")


  def compress(self):
    logger.info(f"Compressing \033[32;1m{self.dump_dir}\033[0m")
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
    logger.info(f"Cleaning \033[32;1m{self.dump_dir}\033[0m")
    self.exec(f"rm -fr {self.dump_dir}")
    # self.run("rm %s"           % (self.zipfile))
    # self.rm_dir(self.updir, self.BACKUPS_DIR)


  def upload(self):
    self.s3 = self.current.get("upload", {}).get("s3")
    if self.s3 is None:
      logger.info("Skipping uploading")
      return

    s3_bucket = self.s3.get("bucket")
    s3_path   = self.s3.get("path", self.name)
    s3_path   = s3_path.replace("<suffix>", self.name)
    s3_dir    = os.path.dirname(self.zip_file)
    s3_dir    = s3_dir.replace("/tmp/backups/", "")
    s3_name   = os.path.basename(self.zip_file)
    s3_folder = "s3://%s/%s/%s" % (s3_bucket, s3_path, s3_dir)

    self.s3_file = "%s/%s" % (s3_folder, s3_name)

    logger.info(f"Uploading \033[32;1m{self.s3_file}\033[0m")
    cmd = "aws s3 cp %s %s/ >%s" % (self.zip_file, s3_folder, self.options.get("errors", "/tmp/backups/errors.log"))
    self.exec(cmd)

    # self.size     = self.read_size(os.path.getsize(self.zipfile))
    # command       = "aws s3 ls %s" % (self.s3file)
    # self.uploaded = self.out(command).strip()
    # # logger.info("Checking upload %s" % (output))
    # logger.info("Checking")

    # return {
    #   "Name"     : "%s" % (self.name),
    #   "File"     : self.zipfile,
    #   "S3 file"  : "<%s|%s>" % (s3view, self.s3file),
    #   "Size"     : self.size,
    #   # "Upload"   : "%s" % (output),
    # }

  def notify(self):
    notifications = self.current.get("notifications", [])
    if notifications is []:
      return

    for config in notifications:
      getattr(self, "notify_" + config["type"])(config)
      print(config)

    # client = WebClient(slack["token"])
    # res = client.chat_postMessage(
    #     channel='#build',
    #     text="Hello world!")
    # assert res["message"]["text"] == "Hello world!"


  def notify_slack(self, config):
    webhook = config.get("webhook")
    payload = {
      "text": "Sup! We're hacking shit together @HackSussex :spaghetti:",
    }
    res = requests.post(webhook,
      data=json.dumps(payload),
      headers={'Content-Type': 'application/json'}
    )

    if res.status_code != 200:
      raise ValueError(
        'Request to slack returned an error %s, the response is:\n%s'
        % (res.status_code, res.text)
      )
