import os

from backups import cli
from backups.logger import Logger

if not os.environ.get("BACKUPS_FILE"):
  os.environ["BACKUPS_FILE"] = "example/backups.yaml"
  Logger.debug(f"==> Backups file set at {os.environ['BACKUPS_FILE']}")

cli.main()
