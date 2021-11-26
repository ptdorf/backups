import os
import time
import yaml

from . import mysql

from .logger import Logger
from .execution import Execution
from .loader import Loader
from .system import System
from .compress import Compressor
from .upload import Uploader
from .notify import Notifier


BACKUPS_DUMP_DIR = os.environ.get("BACKUPS_DUMP_DIR", "/tmp/backups")
BACKUPS_DUMP_BIN = os.environ.get("BACKUPS_DUMP_BIN", "mysqldump")
BACKUPS_STDERR   = os.environ.get("BACKUPS_STDERR",   "/tmp/backups.err")


class Runner:


  def __init__(self, execution: Execution):
    System.DRYRUN = execution.dryrun
    self.execution = execution

    if not os.path.isfile(self.execution.file):
      raise RuntimeError(f"File '{self.execution.file}' doesn't exist.")

    self.data = Loader.yaml(self.execution.file)

    if not "backups" in self.data.keys():
      raise RuntimeError(f"File '{self.file}' doesn't have a backups top key.")

    self.backups = self.data["backups"]
    if not "jobs" in self.backups.keys():
      raise RuntimeError(f"File '{self.file}' doesn't have a jobs defined.")


  def load(self, job):
    if not job in self.backups["jobs"].keys():
      raise RuntimeError(f"Backup job '{job}' doesn't exist.")

    self.execution.job = job

    self.backup  = self.backups["jobs"][job]
    self.options = self.backup.get("options", {})


  def ls(self):
    for job in self.backups["jobs"]:
      print(job)


  def show(self, job=None):
    if job:
      self.load(job)
      print(yaml.dump(self.backup, sort_keys=False))
    else:
      print(yaml.dump(self.data, sort_keys=False))


  def databases(self, job):
    self.load(job)

    self.mysql = mysql.Mysql(self.backup["connection"])
    rows = self.mysql.query("SHOW DATABASES")
    for row in rows:
      print(row["Database"])


  def run(self, job, database):
    self.load(job)
    self.mysql = mysql.Mysql(self.backup["connection"])
    self.prepare(job, database)

    if database:
      self.dumpDatabase(database)

    elif self.options.get("server", False) == True:
      self.dumpServer()

    else:
      databases = self.options.get("databases", [])
      self.dumpDatabases(databases)

    self.compress()
    self.upload()
    self.cleanup()
    self.notify()

    report = {
      "execution":  self.execution
    }

    return report


  def prepare(self, job, database=None):
    global logger
    date = time.strftime("%Y/%m/%d")
    now  = time.strftime("%Y-%m-%d-%H%M%S")
    name = job

    if database:
      name = job + "-" + database

    self.execution.dump = f"{self.execution.dumps}/{name}/{date}/{now}"

    Logger.info(f"Using dir {System.green(self.execution.dump)}")
    System.exec(f"mkdir -p {self.execution.dump}")


  def getMysqlCmd(self):
    return "%s -alv --host=%s --user=%s --password=%s --master-data=%i --triggers --events --dump-date --debug-info --single-transaction" % \
      (
        BACKUPS_DUMP_BIN,
        self.backup["connection"].get("host", ""),
        self.backup["connection"].get("username", ""),
        self.backup["connection"].get("password", ""),
        self.options.get("master-data", 0),
      )


  def dumpServer(self):
    Logger.info("Dumping the server into a single file")

    sql_file = "%s/%s%s.sql" % (self.execution.dump, self.options.get("prefix", ""), "all-databases")
    err_file = self.options.get("stderr", self.execution.stderr)
    command  = f"{self.getMysqlCmd()} --all-databases > {sql_file} 2>{err_file}"

    System.exec(command)



  def dumpDatabases(self, databases):
    Logger.info("Dumping databases")

    ignore  = self.options.get("ignore", [])
    ignored = ignore + ["information_schema", "performance_schema", "sys"]

    if len(databases) < 1:
      rows = self.mysql.query("SELECT SCHEMA_NAME db FROM information_schema.SCHEMATA")
      for row in rows:
        db = row["db"]
        if db in ignored:
          Logger.info(f"Ignoring {System.green(db)}")
          continue

        databases.append(db)

    for database in databases:
      self.dumpDatabase(database)


  def dumpDatabase(self, database):
    Logger.info(f"Dumping database {System.green(database)}")

    sql_file = "%s/%s%s.sql" % (self.execution.dump, self.options.get("prefix", ""), database)
    err_file = self.options.get("stderr", self.execution.stderr)
    command  = f"{self.getMysqlCmd()} --databases {database} > {sql_file} 2>{err_file}"

    System.exec(command)


  def compress(self):
    methods = self.backup.get("compress", [])
    if methods is []:
      Logger.info("Skipping compress")
      return

    for config in methods:
      fn = getattr(Compressor, config["type"])
      fn(config, self.execution)


  def upload(self):
    methods = self.backup.get("upload", [])
    if methods is []:
      Logger.info("Skipping uploads")
      return

    for config in methods:
      fn = getattr(Uploader, config["type"])
      fn(config, self.execution)


  def notify(self):
    methods = self.backup.get("notify", [])
    if methods is []:
      Logger.debug("Skipping notify")
      return

    for config in methods:
      fn = getattr(Notifier, config["type"])
      fn(config, self.execution)


  def cleanup(self):
    clean = self.options.get("clean", "all")
    return
    if not clean or self.execution.dryrun:
      Logger.debug(f"Skip cleaning {System.green(self.execution.dump)} (clean: {clean})")
      return

    start = os.path.dirname(self.execution.dump)
    stop = self.execution.dumps
    Logger.debug(f"Cleaning from {System.green(start)} until {System.green(stop)}")
    System.exec(f"rm -frv {self.execution.dump}* >>{self.execution.stderr} 2>&1")
    System.cleanup(start, stop)
