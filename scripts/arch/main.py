#! /usr/bin/python3

"""Arch script 
Copy dotfiles and install all packages

"""

from lib.welcome import welcome_message

class App:
  def __init__(self):
    self.input_value = None

  def take_input(self):
    self.input_value = input("$ ")
  
  def print_test(self):
    print("test!")
  
  def start(self):
    welcome_message()
    self.take_input()
    
    if self.input_value == "hi":
      self.print_test()

App().start()