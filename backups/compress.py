import os

from . import system
from . import logger


class Compressor:

  @staticmethod
  def _size(file):
    size  = "-"
    human = "-"

    if os.path.isfile(file):
      size  = os.path.getsize(file)
      human = system.size(size)

    return {
      "bytes": size,
      "human": human,
    }


  @staticmethod
  def _details(execution, ext):
    base = os.path.dirname(execution.dump)
    path = os.path.basename(execution.dump)
    file = f"{execution.dump}.{ext}"

    return base, path, file


  @staticmethod
  def zip(config, execution):
    password = config.get("password", "biteme")
    base, path, file = Compressor._details(execution, "zip")

    logger.info(f"Compressing into {system.green(file)}")
    command = f"cd {base} && zip --password {password} -r {file} {path} >>{execution.stderr} 2>&1"
    system.exec(command)

    execution.compress.append({
      "type": "zip",
      "file": file,
      "size": Compressor._size(file),
    })


  @staticmethod
  def tgz(config, execution):
    base, path, file = Compressor._details(execution, "tgz")

    logger.info(f"Compressing into {system.green(file)}")
    command = f"cd {base} && tar -czvf {file} {path} >>{execution.stderr} 2>&1"
    system.exec(command)

    execution.compress.append({
      "type": "tgz",
      "file": file,
      "size": Compressor._size(file),
    })
