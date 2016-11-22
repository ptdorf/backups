# backup-mysql

Basic tool to backup mysql servers.

[![Build Status](https://travis-ci.org/ptdorf/backup-mysql.svg?branch=master)](https://travis-ci.org/ptdorf/backup-mysql)


### Installation

    pip install --upgrade backup-mysql


### Setup

Create a `/etc/backups/backups.yaml` file with content similar to:

```yaml
backups:
  server:
    connection:
      type:                   mysql
      host:                   localhost
      username:               backup
      password:               password
    options:
      encryption:             secret
    s3:
      bucket:                 acme-backup-databases
      path:                   live/mysql/<suffix>

```

Now run it with

    backup-mysql server
