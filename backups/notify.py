import json
import requests


def notify_slack(config, context):
  webhook = config.get("webhook")
  payload = {
    "text": "Sup! We're hacking shit together @HackSussex :spaghetti:",
    "channel": config.get("channel", "#backups"),
  }
  res = requests.post(webhook,
    data=json.dumps(payload),
    headers={'Content-Type': 'application/json'}
  )

  if res.status_code != 200:
    raise ValueError(
      'Request to slack returned an error %s, the response is:\n%s'
      % (res.status_code, res.text)
    )

  context.notifications.append({
    "type": "slack",
    "status": res.status_code,
    "channel": config.get("channel", "#backups"),
  })
