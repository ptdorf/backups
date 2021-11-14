import os
import re
import yaml


class Loader:

  @staticmethod
  def env(loader: yaml.BaseLoader, node: yaml.Node):
    default = "(not-set)"

    if isinstance(node, yaml.nodes.SequenceNode):
      names = loader.construct_sequence(node)
      name = names[0]
      if len(names) > 1:
        default = names[1]
      return Loader._resolve(name, default)

    elif isinstance(node, yaml.nodes.ScalarNode):
      name = loader.construct_scalar(node)
      return Loader._resolve(name, default)

    else:
      raise Exception("Only scalars and sequences are allowed in the '!env'.")


  @staticmethod
  def _resolve(text: str, default: str = ""):
    if text.find("${") < 0:
      value = os.environ.get(text)
      if value:
        return value
      return default

    pattern = re.compile("\$\{(.*?)\}+")
    matches = pattern.findall(text)
    for m in matches:
      val = os.environ.get(m, default)
      text = text.replace("${" + m + "}", val)

    return text


  @staticmethod
  def yaml(file: str):
    yaml.add_constructor("!Env", Loader.env, yaml.SafeLoader)
    with open(file, "r") as f:
      data = yaml.load(f, yaml.SafeLoader)
    return data
