import time
import logging

class Logger:

  COLOR_DEBUG = "38;5;242"
  COLOR_INFO = "0"
  COLOR_WARN = "32;1"
  COLOR_ERROR = "31;1"


  def __init__(self, verbose: bool):
    self.verbose = verbose
    self.logger = logging.getLogger(__name__)

    if self.verbose:
      self.logger.setLevel(logging.DEBUG)

    self.logger.addHandler(logging.StreamHandler())


  def _format(self, message: str, color: str = None):
    if color:
      now = time.strftime("%Y-%m-%d %H:%M:%S")
      return f"\033[{color}m{now}  {message}\033[0m"

    return message


  def info(self, message: str):
    self.logger.info(self._format(message))


  def debug(self, message: str):
    self.logger.debug(self._format(message, self.COLOR_DEBUG))
