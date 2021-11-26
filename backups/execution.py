# from . import data
# class Context(data.Data):


class Execution:

  def __init__(self, **kwargs):
    self.file   = None
    self.job    = None
    self.dumps  = None
    self.dump   = None
    self.stderr = None
    self.dryrun = None

    self.compress = []
    self.upload   = []
    self.notify   = []

    for k, v in kwargs.items():
      # print(f"{k} :: {v}")
      setattr(self, k, v)


  def __str__(self):
    text = str(self.__class__) + "{"
    for k, v in self.__dict__.items():
      text = f"{text}'{k}': '{v}', "
    text = text[0:-2] + "}"

    return text
