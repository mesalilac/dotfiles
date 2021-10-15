from os import system

def pacman(package): system(f'sudo pacman -S {package}')
def yay(package): system(f'yay -S {package}')