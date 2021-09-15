#! /usr/bin/python3

"""Arch script 
Copy dotfiles and install all packages

"""

from lib.welcome import welcome_message
from pathlib import Path
from config import config
from lib.start_script import start_script

class App:
  def __init__(self):
    self.input_value = None

  def take_input(self):
    print('''
0. exit
1. start

input 0 or 1
          ''')
    self.input_value = input("$ ")
    
  def check_path(self):
    _path = str(Path().absolute())
    
    if "scripts/arch" in _path:
      # remove scripts/arch from path string or throw error end exit  
      print("Run main.py from dotfiles root dir\nThis way ./scripts/arch/main.py")
      exit(1)

  def start(self):
    self.check_path()
    welcome_message()
    self.take_input()
    
    if self.input_value == "0":
      print("Goodbye")
      exit(0)
      
    if self.input_value == "1":
      start_script(config)

App().start()