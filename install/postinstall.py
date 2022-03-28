#!/usr/bin/python3
# -*- coding: utf-8 -*-

"""
This script is run after install.py.
This script should be placed in the home directory, together with install.py.
"""

# ------------------------------- Module Import -------------------------------
import subprocess


# ---------------------------- Function Definition ----------------------------
def generate_symbolic_links():
    mappings = {
        '~/.vim/vimrc': '~/.vimrc',
        '~/.vim/bashrc': '~/.bashrc',
        '~/.vim/git/gitconfig': '~/.gitconfig',
        '$(which fdfind)': '~/.local/bin/fd',
    }
    for item in mappings.items():
        command = ['ln', '-sf']
        command.append(item[0])     # Key
        command.append(item[1])     # Value
        subprocess.run(command)


# --------------------------- Call the Main Function --------------------------
if __name__ == '__main__':
    generate_symbolic_links()
