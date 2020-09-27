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
  BACKUPS_FILE          The backups file (default /etc/backups/backups.yaml)
  BACKUPS_DUMPS_DIR     The dumps directory (default /tmp/backups)
  BACKUPS_MYSQLDUMP     The mysqldump binary (default picked from $PATH)
  BACKUPS_LOG_LEVEL     Default INFO
  BACKUPS_STDERR_FILE   The stderr log file (default /tmp/backups.err)

Check https://github.com/ptdorf/backups#backups for more info

"""
import yaml
from docopt import docopt
from executor import Executor

def main():
  args = docopt(__doc__, version="0.2.0")
  if args["--verbose"]:
    for k, v in args.items():
      print(f"\033[38;5;242m{k}: {v}\033[0m")

  executor = Executor(args['--file'], args['--dryrun'])

  if args["ls"]:
    executor.ls()

  elif args["show"]:
    executor.show(args["NAME"])

  elif args["databases"]:
    executor.databases(args["NAME"])

  elif args["run"]:
    report = executor.run(args["NAME"], args["DATABASE"])
    print("\nREPORT")
    print(yaml.dump(report, sort_keys=False))

  exit()


if __name__ == "__main__":
  main()
