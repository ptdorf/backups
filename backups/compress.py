import os

from . import system
from . import logger


class Compress:

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
  def _details(context, ext):
    base = os.path.dirname(context.dump)
    path = os.path.basename(context.dump)
    file = f"{context.dump}.{ext}"

    return base, path, file


  @staticmethod
  def zip(config, context):
    password = config.get("password", "biteme")
    base, path, file = Compress._details(context, "zip")

    logger.info(f"Compressing into {system.green(file)}")
    command = f"cd {base} && zip --password {password} -r {file} {path} >>{context.stderr} 2>&1"
    system.exec(command)

    context.compress.append({
      "type": "zip",
      "file": file,
      "size": Compress._size(file),
    })


  @staticmethod
  def tgz(config, context):
    base, path, file = Compress._details(context, "tgz")

    logger.info(f"Compressing into {system.green(file)}")
    command = f"cd {base} && tar -czvf {file} {path} >>{context.stderr} 2>&1"
    system.exec(command)

    context.compress.append({
      "type": "tgz",
      "file": file,
      "size": Compress._size(file),
    })
