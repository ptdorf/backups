import os

def resolve(value):
  if value[0:1] == "$":
    value = os.environ.get(value[1:], value)

  return value
