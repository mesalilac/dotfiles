from config import config
from install.packages import packages
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
help_message = '''
help\t help message
exit\t exit script
clear\t clear the screen
sync\t sync local dotfiles with dotfiles repo

install-packages\t install packages

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

      elif user_input.value == "install-packages":
        packages()

      elif not user_input.value:
        ...
      
      else: 
        print(f"{user_input.value} is not a valid command")

app = App()

app.init()