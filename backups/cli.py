"""
Backs up databases servers

Usage:
  backups ls                    [--file FILE]
  backups show [JOB]            [--file FILE]
  backups databases JOB         [--file FILE]
  backups run JOB               [--file FILE] [--verbose] [--dryrun]
  backups run JOB [DATABASE]    [--file FILE] [--verbose] [--dryrun]
  backups env
  backups version
  backups help

Commands:
  ls          Lists all the backup job names
  show        Shows all the configuration or just for a specific job
  databases   Lists all databases on a backup job server
  run         Runs the backup for a job
  env         Show the current environment

Options:
  -f --file FILE    The backups config file (default /etc/backups/backups.yaml)
  -d --dryrun       Just prints the commands but don't execute them
  -v --verbose      Adds verbosity
  -h --help         Prints this help
     --version      Prints the current version

Environment variables:
  BACKUPS_FILE          The backups config file (default /etc/backups/backups.yaml)
  BACKUPS_DUMPS_DIR     The dumps directory (default /tmp/backups)
  BACKUPS_MYSQLDUMP     The mysqldump binary (default picked from $PATH)
  BACKUPS_LOG_LEVEL     Default INFO
  BACKUPS_STDERR        The stderr log file (default /tmp/backups.err)
  BACKUPS_VERBOSE       Set verbosity (default False)

Check https://github.com/ptdorf/backups#backups for more info
"""
import os
import yaml
import docopt

from . import version

from .logger import Logger
from .execution import Execution
from .runner import Runner

DEFAULT_FILE      = "/etc/backups/backups.yaml"
DEFAULT_DUMP_DIR  = "/tmp/backups"
DEFAULT_DUMP_BIN  = "mysqldump"
DEFAULT_LOG_LEVEL = "INFO"
DEFAULT_STDERR    = "/tmp/backups.err"
DEFAULT_DRYRUN    = False
DEFAULT_VERBOSE   = False


class Cli:

  def __init__(self):
    self.load()


  def load(self):
    self.env = {
      "file"       : os.environ.get("BACKUPS_FILE",       DEFAULT_FILE),
      "dump_dir"   : os.environ.get("BACKUPS_DUMP_DIR",   DEFAULT_DUMP_DIR),
      "dump_bin"   : os.environ.get("BACKUPS_DUMP_BIN",   DEFAULT_DUMP_BIN),
      "log_level"  : os.environ.get("BACKUPS_LOG_LEVEL",  DEFAULT_LOG_LEVEL),
      "dryrun"     : os.environ.get("BACKUPS_DRYRUN",     DEFAULT_DRYRUN),
      "stderr"     : os.environ.get("BACKUPS_STDERR",     DEFAULT_STDERR),
      "verbose"    : os.environ.get("BACKUPS_VERBOSE",    DEFAULT_VERBOSE),
    }

    Logger.level(self.env["log_level"])


  def version(self):
    print(version.VERSION)


  def help(self):
    print(__doc__)


def main():
  args = docopt.docopt(__doc__, version=version.VERSION)
  cli = Cli()
  cli.run(args)

  if env["verbose"]:
    args["--verbose"] = True

  Logger.debug("Arguments:")
  for k, v in args.items():
    Logger.debug(f"  {k}: {v}")

  if args["version"]:
    print(version.VERSION)
    return

  if args["help"]:
    print(__doc__)
    return

  file = args['--file'] if args['--file'] else env["file"]

  if args["env"]:
    print("Backups defaults")
    print("  File          ", DEFAULT_FILE)
    print("  Dump dir      ", DEFAULT_DUMP_DIR)
    print("  Dump bin      ", DEFAULT_DUMP_BIN)
    print("  Log level     ", DEFAULT_LOG_LEVEL)
    print("  Dryrun        ", DEFAULT_DRYRUN)
    print("  Stderr        ", DEFAULT_STDERR)
    print("  Version       ", version.VERSION)
    print("")
    print("Environment variables")
    print("  BACKUPS_FILE          ", env["file"])
    print("  BACKUPS_DUMP_DIR      ", env["dump_dir"])
    print("  BACKUPS_DUMP_BIN      ", env["dump_dir"])
    print("  BACKUPS_LOG_LEVEL     ", env["log_level"])
    print("  BACKUPS_STDERR        ", env["stderr"])
    print("  BACKUPS_DRYRUN        ", env["dryrun"])
    return

  kwargs = {
    "file": file,
    "stderr": env["stderr"],
    "dryrun": env["dryrun"],
  }

  execution = Execution(**kwargs)
  runner = Runner(execution)

  if args["ls"]:
    return runner.ls()

  if args["show"]:
    return runner.show(args.get("JOB"))

  if args["databases"]:
    return runner.databases(args["JOB"])

  if args["run"]:
    report = runner.run(args["JOB"], args["DATABASE"])
    print("\nREPORT")
    print(yaml.dump(report, sort_keys=False))


if __name__ == "__main__":
  exit(main())
