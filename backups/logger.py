import os
import time


class Logger:

  COLOR_DEBUG = "38;5;242"
  COLOR_INFO  = "0"
  COLOR_WARN  = "32;1"
  COLOR_ERROR = "31;1"

  LEVEL = os.environ.get("BACKUPS_LOG_LEVEL", "INFO").lower()
  TIMES = bool(os.environ.get("BACKUPS_LOG_TIMES", ""))

  @classmethod
  def level(cls, value: str = None):
    if value is None:
      return Logger.LEVEL
    Logger.LEVEL = value


  @classmethod
  def timestamps(cls, value: bool = None):
    if value is None:
      return cls.TIMES
    cls.TIMES = value


  @classmethod
  def _print(cls, message: str, color: str = "0"):
    message = f"\033[{color}m{message}\033[0m"

    if Logger.TIMES:
      now = time.strftime("%Y-%m-%d %H:%M:%S")
      message = f"\033[{cls.COLOR_DEBUG}m{now}\033[0m  {message}"

    print(message)


  @classmethod
  def info(cls, message: str):
    cls._print(message)


  @classmethod
  def debug(cls, message: str):
    if cls.LEVEL != "debug":
      return

    cls._print(message, cls.COLOR_DEBUG)
