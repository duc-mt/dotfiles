#!/usr/bin/python3
# -*- coding: utf-8 -*-

"""
This is the second script to run after install.py.
This script should be placed in the home directory, together with install.py.
"""

# ------------------------------- Module Imports ------------------------------
import os
import subprocess


# ---------------------------- Function Definitions ---------------------------
def install_fzf():
    location = '.vim/pack/file-system/start/fzf/'
    os.chdir(location)
    subprocess.Popen('./install')
    os.chdir(vim_folder)


def generate_symbolic_links():
    command = ['ln', '-sf']
    mappings = {
        '~/.vim/vimrc': '~/.vimrc',
        '~/.vim/bashrc': '~/.bashrc',
        '~/.vim/git/gitconfig': '~/.gitconfig',
        '$(which fdfind)': '~/.local/bin/fd',
    }
    for target, link_name in mappings.items():
        # Create a link to target with the name link_name.
        subprocess.run(command + list(target) + list(link_name))


# --------------------------- Call the Main Function --------------------------
if __name__ == '__main__':
    install_fzf()
    generate_symbolic_links()
