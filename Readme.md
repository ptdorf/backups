# backup-mysql

Basic tool to backup mysql servers.


### Installation

    pip install --upgrade backup-mysql


### Setup

Create a `/etc/backups/backups.yaml` with content similar to

```yaml
backups:
  server:
    connection:
      type:                   mysql
      host:                   localhost
      username:               backup
      password:               x
    options:
      encryption:             x
    s3:
      bucket:                 acme-backup-databases
      path:                   live/mysql/<suffix>

```
