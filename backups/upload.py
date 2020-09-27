import os
import logger
import system


def _files(config, context):
  prefix  = config.get("prefix", context.name)
  prefix  = prefix.replace("<name>", context.name)
  base    = os.path.dirname(context.dump)
  subpath = base.replace(context.dumps + "/", "")
  folder  = f"{prefix}/{subpath}"

  files = []
  for name in os.listdir(base):
    file = os.path.join(base, name)
    if os.path.isdir(file):
      continue
    files.append((file, name))

  return folder, files


def upload_s3(config, context):
  bucket  = config.get("bucket")
  uploads = []
  folder, files = _files(config, context)
  for file, name in files:
    name = os.path.basename(file)
    dest = f"s3://{bucket}/{folder}/{name}"

    logger.info(f"Uploading to S3 {system.green(file)}")
    command = f"aws s3 cp {file} {dest} >{context.stderr} 2>&1"
    system.exec(command)
    uploads.append(dest)

  context.uploads.append({
    "type": "s3",
    "files": uploads,
  })


def upload_gs(config, context):
  bucket  = config.get("bucket")
  uploads = []
  folder, files = _files(config, context)
  for file, name in files:
    name = os.path.basename(file)
    dest = f"gs://{bucket}/{folder}/{name}"

    logger.info(f"Uploading to GS {system.green(file)}")
    command = f"gsutil cp {file} {dest} >{context.stderr} 2>&1"
    system.exec(command)
    uploads.append(dest)

  context.uploads.append({
    "type": "gs",
    "files": uploads,
  })
