from config import config

if not config["root"] or not config["home"]:
  print("Both 'root' and 'home' requirements!")
  exit(1)

class User_input:
  ''' get user input '''
  def __init__(self):
    self.value

  def get(self): ...

class App:
  def init(self): print("hi")

app = App()

app.init()