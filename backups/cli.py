"""
Backups mysql databases

Usage:
  backups env
  backups ls                    [--file FILE] [--verbose]
  backups show JOB              [--file FILE] [--verbose]
  backups databases JOB         [--file FILE] [--verbose]
  backups run JOB               [--file FILE] [--verbose] [--dryrun]
  backups run JOB [DATABASE]    [--file FILE] [--verbose] [--dryrun]

Commands:
  env         Show the current environment
  ls          Prints the backup job names
  show        Prints the configuration for a job
  databases   Lists all databases on a backup job server
  run         Runs the backup for a job

Options:
  -f --file FILE    The backups config file (default /etc/backups/backups.yaml)
  -d --dryrun       Just prints the commands but doesn't execute them
  -v --verbose      Adds verbosity
  -h --help         Prints this help
     --version      Prints the current version

Environment variables:
  BACKUPS_FILE          The backups file (default /etc/backups/backups.yaml)
  BACKUPS_DUMPS_DIR     The dumps directory (default /tmp/backups)
  BACKUPS_MYSQLDUMP     The mysqldump binary (default picked from $PATH)
  BACKUPS_LOG_LEVEL     Default INFO
  BACKUPS_STDERR        The stderr log file (default /tmp/backups.err)

Check https://github.com/ptdorf/backups#backups for more info

"""
import os
import yaml
import docopt

from . import version
from . import runner

BACKUPS_FILE       = os.environ.get("BACKUPS_FILE", "/etc/backups/backups.yaml")
BACKUPS_DUMPS_DIR  = os.environ.get("BACKUPS_DUMPS_DIR", "/tmp/backups")
BACKUPS_MYSQLDUMP  = os.environ.get("BACKUPS_MYSQLDUMP", "mysqldump")
BACKUPS_LOG_LEVEL  = os.environ.get("BACKUPS_LOG_LEVEL", "INFO")
BACKUPS_STDERR     = os.environ.get("BACKUPS_STDERR", "/tmp/backups.err")


def main():
  args = docopt.docopt(__doc__, version=version.VERSION)
  if args["--verbose"]:
    print("Backups arguments")
    for k, v in args.items():
      print(f"    \033[38;5;242m{k}: {v}\033[0m")

  file = args['--file'] if args['--file'] else BACKUPS_FILE

  if args["env"]:
    print("Backups environment")
    print("    File          ", file)
    print("    Dumps dir     ", BACKUPS_DUMPS_DIR)
    print("    Mysqldump     ", BACKUPS_MYSQL_DUMP)
    print("    Log level     ", BACKUPS_LOG_LEVEL)
    print("    Stderr        ", BACKUPS_STDERR_FILE)
    print("    Version       ", version.VERSION)
    exit()

  run = runner.Runner(file, args['--dryrun'])
  run.verbose = args["--verbose"]

  if args["ls"]:
    run.ls()

  elif args["show"]:
    run.show(args["JOB"])

  elif args["databases"]:
    run.databases(args["JOB"])

  elif args["run"]:
    report = run.run(args["JOB"], args["DATABASE"])
    print("\nREPORT")
    print(yaml.dump(report, sort_keys=False))

  return


def increment(c):
  c.uploads.append(4)


if __name__ == "__main__":
  exit(main())
  # import context
  # c = context.Context()
  # # c.uploads = [1]
  # increment(c)
  # print(c)
