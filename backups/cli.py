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
from .runner import Runner

DEFAULT_FILE       = "/etc/backups/backups.yaml"
DEFAULT_DUMPS_DIR  = "/tmp/backups"
DEFAULT_MYSQLDUMP  = "mysqldump"
DEFAULT_LOG_LEVEL  = "INFO"
DEFAULT_STDERR     = "/tmp/backups.err"
DEFAULT_VERBOSE    = False

BACKUPS_FILE       = os.environ.get("BACKUPS_FILE",       DEFAULT_FILE)
BACKUPS_DUMPS_DIR  = os.environ.get("BACKUPS_DUMPS_DIR",  DEFAULT_DUMPS_DIR)
BACKUPS_MYSQLDUMP  = os.environ.get("BACKUPS_MYSQLDUMP",  DEFAULT_MYSQLDUMP)
BACKUPS_LOG_LEVEL  = os.environ.get("BACKUPS_LOG_LEVEL",  DEFAULT_LOG_LEVEL)
BACKUPS_STDERR     = os.environ.get("BACKUPS_STDERR",     DEFAULT_STDERR)
BACKUPS_VERBOSE    = os.environ.get("BACKUPS_VERBOSE",    DEFAULT_VERBOSE)

logger = Logger(BACKUPS_VERBOSE)


def main():
  args = docopt.docopt(__doc__, version=version.VERSION)

  if BACKUPS_VERBOSE:
    args["--verbose"] = True

  if args["--verbose"]:
    logger.debug("Verbosity: enabled")
    logger.debug("Arguments:")
    for k, v in args.items():
      logger.debug(f"  {k}: {v}")

  if args["version"]:
    print(version.VERSION)
    return

  if args["help"]:
    print(__doc__)
    return

  file = args['--file'] if args['--file'] else BACKUPS_FILE

  if args["env"]:
    print("Backups environment")
    print("  File          ", file)
    print("  Dumps dir     ", BACKUPS_DUMPS_DIR)
    print("  Mysqldump     ", BACKUPS_MYSQLDUMP)
    print("  Log level     ", BACKUPS_LOG_LEVEL)
    print("  Stderr        ", BACKUPS_STDERR)
    print("  Version       ", version.VERSION)
    print("")
    print("Environment variables")
    print("  BACKUPS_FILE          ", BACKUPS_FILE)
    print("  BACKUPS_DUMPS_DIR     ", BACKUPS_DUMPS_DIR)
    print("  BACKUPS_MYSQLDUMP     ", BACKUPS_MYSQLDUMP)
    print("  BACKUPS_LOG_LEVEL     ", BACKUPS_LOG_LEVEL)
    print("  BACKUPS_STDERR        ", BACKUPS_STDERR)
    return

  runner = Runner(file, args['--dryrun'])
  runner.verbose = args["--verbose"]

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
