import os

from backups import cli

if not os.environ.get("BACKUPS_FILE"):
  os.environ["BACKUPS_FILE"] = "example/backups.yaml"

cli.main()
