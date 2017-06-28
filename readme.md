# backups

Basic tool to backup mysql servers.


### Installation

    pip install --upgrade backups


### Setup

Create a `/etc/backups/backups.yaml` file with content similar to:

```yaml
backups:
  acme.com:
    connection:
      type:                   mysql
      host:                   localhost
      username:               backup
      password:               password
    options:
      encryption:             secret
    s3:
      bucket:                 acme-backups
      path:                   <suffix>/live/mysql

```

Now run it with

    backup-mysql acme.com


### Build status

  - [![Build Status](https://travis-ci.org/ptdorf/backups.svg?branch=master)](https://travis-ci.org/ptdorf/backups) https://travis-ci.org/ptdorf/backups
  - http://jenkins.dotser.com/job/backups

