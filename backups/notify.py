import json
import requests


class Notifier:

  @staticmethod
  def _size(execution):
    if execution.compress is []:
      return "-"

    size = ""
    for compression in execution.compress:
      size = f"{size}{compression['size']['human']}, "

    size = f"{size[0:-2]}"
    return size


  @staticmethod
  def slack(config, execution):
    webhook = config.get("webhook")
    text    = f"Backup `{execution.job}` completed with *{Notifier._size(execution)}*"
    channel = config.get("channel", "#backups")

    payload = {
      "text": text,
      "channel": channel,
    }

    res = requests.post(webhook,
      data=json.dumps(payload),
      headers={'Content-Type': 'application/json'}
    )

    if res.status_code != 200:
      raise RuntimeError(
        'Request to slack returned an error %s, the response is:\n%s'
        % (res.status_code, res.text)
      )

    execution.notify.append({
      "type": "slack",
      "text": text,
      "status": res.status_code,
      "channel": channel,
    })
