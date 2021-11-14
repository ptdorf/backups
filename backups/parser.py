import os
import re
import yaml


def parse(file):
  loader  = yaml.SafeLoader
  tagEnv  = '!Env'
  tagConf = '!Conf'

  patternEnv  = re.compile('.*?\${(\w+):?(.*)}.*?')
  patternConf = re.compile('@(.*)')

  loader.add_implicit_resolver(tagEnv,  patternEnv,  None)
  loader.add_implicit_resolver(tagConf, patternConf, None)

  def constructorEnv(loader, node):
    value = loader.construct_scalar(node)
    match = patternEnv.findall(value)
    if match:
      res = value
      for group in match:
        var = os.environ.get(group[0], group[1] or f"${group[0]}")
        res = res.replace(value, var)
      return res

    return value

  def constructorConf(loader, node):
    value = loader.construct_scalar(node)
    match = patternConf.findall(value)
    if match:
      env = {}
      with open(match[0], "r") as f:
        for line in f.readlines():
          if line.find("=") > 0:
            key, val = line.split("=")
            env[key] = val.strip()
            os.environ[key] = env[key]
        return env
    return value

  loader.add_constructor(tagEnv,  constructorEnv)
  loader.add_constructor(tagConf, constructorConf)

  with open(file, "r") as f:
    data = yaml.load(f, Loader=loader)

  return data
