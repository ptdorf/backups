# backups

[![Build Status](https://travis-ci.org/ptdorf/backups.svg?branch=master)](https://travis-ci.org/ptdorf/backups)

Basic tool to backup mysql servers.


## Installation

    pip install --upgrade backups


## Usage

```
$ backups run local --help
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
```


## Setup

Create a `/etc/backups/backups.yaml` file with content similar to:

```yaml
backups:
  acme:
    connection:
      type:         mysql
      host:         acme.com
      username:     backups
      password:     password
    upload:
      s3:
        bucket: acme-backups
        path:   databases
    options:
      # By default it will create a single dump file for each database found
      # Uncomment the options below to change this
      # database:     main_db   # Uncomment to dump this single database
      # server:       true      # Uncomment to dump the server into a single file
      encryption
        pasword:    secret

```

Now run it with

    backup-mysql run acme

Or if you placed the backup file in some other place:

    backup-mysql run acme --file examples/mysql.yaml
