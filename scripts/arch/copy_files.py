from config import config
import os

def copy_files():
  ''' copy all files '''
  root = config["root"]
  cd_root = f"cd {root}"
  
  