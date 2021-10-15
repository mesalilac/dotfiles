from config import config

if not config["root"] or not config["home"]:
  print("Both 'root' and 'home' requirements!")
  exit(1)
