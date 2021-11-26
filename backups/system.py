import os

from .logger import Logger


class System:

  DRYRUN = False

  @staticmethod
  def exec(command, dryrun: bool = None):
    Logger.debug(f"Running '{command}'")

    print(f"system: {System.DRYRUN}")
    print(f"Local {dryrun}")
    if dryrun is None and System.DRYRUN is False:
      print(f"STOP dryrun {command}")
      return

    code = os.system(command)
    if code != 0:
      raise RuntimeError(f"Command '{command}' failed.")


  @staticmethod
  def size(bytes, suffix="B"):
    units = ["", "K", "M", "G", "T", "P", "E", "Z"]
    for unit in units:
      if abs(bytes) < 1024.0:
        return "%3.1f %s%s" % (bytes, unit, suffix)
      bytes /= 1024.0

    return "%.1f %s%s" % (bytes, "Y", suffix)


  @staticmethod
  def green(message: str) -> str:
    return f"\033[32;1m{message}\033[0m"


  @staticmethod
  def cleanup(start, stop):
    while start != stop:
      try:
        System.exec(f"rmdir {start}")
      except Exception as e:
        print(f"Failed to remove dir {start}")
        return

      start = os.path.dirname(start)
