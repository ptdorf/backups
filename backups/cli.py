"""
Backups mysql databases and server

Usage:
  backups env
  backups ls                    [--file FILE] [--verbose]
  backups show NAME             [--file FILE] [--verbose]
  backups databases NAME        [--file FILE] [--verbose]
  backups run NAME              [--file FILE] [--verbose] [--dryrun]
  backups run NAME [DATABASE]   [--file FILE] [--verbose] [--dryrun]

Commands:
  env         Show the current environment
  ls          Prints the backups names
  show        Prints the configuration for a named backup
  databases   Lists all databases on a name backup server
  run         Runs the backup for a config

Options:
  -f --file FILE    The backups config file (default /etc/backups/backups.yaml)
  -d --dryrun       Just prints the commands but doesn't execute them
  -v --verbose      Adds verbosity
  -h --help         Prints this help
     --version      Prints the current version

Environment variables:
  BACKUPS_FILE          The backups file (default /etc/backups/backups.yaml)
  BACKUPS_DUMPS_DIR     The dumps directory (default /tmp/backups)
  BACKUPS_MYSQL_DUMP    The mysqldump binary (default picked from $PATH)
  BACKUPS_LOG_LEVEL     Default INFO
  BACKUPS_STDERR_FILE   The stderr log file (default /tmp/backups.err)

Check https://github.com/ptdorf/backups#backups for more info

"""
import os
import yaml
import docopt
import runner


BACKUPS_FILE        = os.environ.get("BACKUPS_FILE", "/etc/backups/backups.yaml")
BACKUPS_DUMPS_DIR   = os.environ.get("BACKUPS_DUMPS_DIR", "/tmp/backups")
BACKUPS_MYSQL_DUMP  = os.environ.get("BACKUPS_MYSQL_DUMP", "mysqldump")
BACKUPS_LOG_LEVEL   = os.environ.get("BACKUPS_LOG_LEVEL", "INFO")
BACKUPS_STDERR_FILE = os.environ.get("BACKUPS_STDERR_FILE", "/tmp/backups.err")


def main():
  args = docopt.docopt(__doc__, version="0.2.0")
  if args["--verbose"]:
    for k, v in args.items():
      print(f"\033[38;5;242m{k}: {v}\033[0m")

  file = args['--file'] if args['--file'] else BACKUPS_FILE
  run = runner.Runner(file, args['--dryrun'])

  if args["env"]:
    print("Backups environment")
    print("    File          ", file)
    print("    Dump dir      ", BACKUPS_DUMPS_DIR)
    print("    Mysql dump    ", BACKUPS_MYSQL_DUMP)
    print("    Log level     ", BACKUPS_LOG_LEVEL)
    print("    Std err file  ", BACKUPS_STDERR_FILE)

  if args["ls"]:
    run.ls()

  elif args["show"]:
    run.show(args["NAME"])

  elif args["databases"]:
    run.databases(args["NAME"])

  elif args["run"]:
    report = run.run(args["NAME"], args["DATABASE"])
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
