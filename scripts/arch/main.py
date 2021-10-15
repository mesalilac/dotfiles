from config import config
import os

if not config["root"] or not config["home"]:
  print("Both 'root' and 'home' requirements!")
  exit(1)

class User_input:
  ''' get user input '''
  def __init__(self):
    self.value = ""

  def get(self): 
    self.value = input("# ").lower()

user_input = User_input()
help_message = '''Arch install script

commands:
\thelp\t help message
\texit\t exit script
\tclear\t clear the screen
\tsync\t sync local dotfiles with dotfiles repo

'''

class App:
  def __init__(self):
    self.exit = False

  def init(self): 
    print(help_message)
    while not self.exit:
      user_input.get()

      if user_input.value == "help": print(help_message)

      elif user_input.value == "exit":
        self.exit = True
      
      elif user_input.value == "clear": os.system("clear")
      
      elif user_input.value == "sync":
        ...

      elif not user_input.value:
        ...
      
      else: 
        print(f"{user_input.value} is not a valid command")

app = App()

app.init()