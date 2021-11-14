import sys

from backups import cli

sys.argv.append("--file")
sys.argv.append("example/backups.yaml")
sys.argv.append("show")

cli.main()
