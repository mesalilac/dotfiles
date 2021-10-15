from config import config

if not config["root"] or not config["home"]:
  print("Both 'root' and 'home' requirements!")
  exit(1)

class User_input:
  ''' get user input '''
  def __init__(self):
    self.value = ""

  def get(self): 
    self.value = input("# ")

user_input = User_input()
help_message = '''Arch install script

commands:
\thelp\t help message
'''

class App:
  def __init__(self):
    self.exit = False

  def init(self): 
    print(help_message)
    while not self.exit:
      user_input.get()

      if user_input.value == "help":
        print(help_message)

      if user_input.value == "exit":
        self.exit = True

app = App()

app.init()