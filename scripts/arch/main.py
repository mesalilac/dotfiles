#! /usr/bin/python3

"""Arch script 
Copy dotfiles and install all packages

"""

from lib.welcome import welcome_message
from pathlib import Path

class App:
  def __init__(self):
    self.input_value = None

  def take_input(self):
    self.input_value = input("$ ")
  
  def print_test(self):
    print(Path().absolute())
  
  def start(self):
    welcome_message()
    # self.take_input()
    _path = str(Path().absolute())
    
    if "scripts/arch" in _path:
      # remove scripts/arch or throw error end exit  
      print("Run main.py from dotfiles root dir\nThis way ./scripts/arch/main.py")
      exit(1)
    
    if self.input_value == "hi":
      self.print_test()

App().start()