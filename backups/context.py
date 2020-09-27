import data

class Context(data.Object):

  def __init__(self):
    self.file   = None
    self.name   = None
    self.dumps  = None
    self.dump   = None
    self.stderr = None
    self.dryrun = None

    self.compressions  = []
    self.uploads       = []
    self.notifications = []
