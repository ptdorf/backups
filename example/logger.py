from backups.logger import Logger


Logger.timestamps(True)
Logger.level("debug")
Logger.debug("1. debug")
Logger.info("1. info")

Logger.timestamps(False)
Logger.level("info")
Logger.debug("2. debug")
Logger.info("2. info")

Logger.timestamps(True)
Logger.level("debug")
Logger.debug("3. debug")
Logger.info("3. info")
