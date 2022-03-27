#!/usr/bin/python3
# -*- coding: utf-8 -*-

"""
This is the first script to run after installing Linux.
This script should be placed in the home directory.
"""

# ------------------------------- Module Import -------------------------------
import os
import subprocess


# ------------------------------- Named Constant ------------------------------
SUDO = ['sudo', 'apt']


# ---------------------------- Function Definitions ---------------------------
def upgrade_packages():
    subprocess.run(SUDO + ['update'])
    subprocess.run(SUDO + ['full-upgrade', '-y'])


def install_dependencies():
    command = SUDO + ['install', '-y']
    packages = ['make', 'build-essential', 'libncurses5', 'git']
    subprocess.run(command + packages)


def perform_installation(location, name):
    wd = os.getcwd()
    os.chdir(location)
    subprocess.Popen('make')
    subprocess.Popen(['sudo', 'make', 'install'])
    os.chdir('/tmp/')
    subprocess.Popen(['rm', '-rf', name + '/'])
    os.chdir(wd)


def clone_vim():
    location = '/tmp/vim/'
    subprocess.run([
        'git', 'clone',
        'https://github.com/vim/vim.git', location,
    ])
    # perform_installation(location + 'src/', 'vim')


def install_linux_packages():
    command = SUDO + ['install', '-y']
    packages = [
        'tree', 'figlet', 'hugo', 'python3', 'python3-pip', 'pandoc',
        'texlive-latex-extra', 'sqlformat', 'python3-q-text-as-data',
        'net-tools', 'ipcalc', 'vsftpd', 'nethogs', 'nmap', 'aircrack-ng',
        'fd-find', 'mlocate',
    ]
    subprocess.run(command + packages)


def install_python_packages():
    command = ['python3', '-m', 'pip', 'install', '--user', '--upgrade']
    packages = [
        'mypy', 'starcli', 'rich', 'bs4', 'pygame', 'autopep8', 'pytest'
    ]
    subprocess.run(command + packages)


def clone_git_sh():
    location = '/tmp/git-sh/'
    subprocess.run([
        'git', 'clone',
        'https://github.com/rtomayko/git-sh.git', location,
    ])
    # perform_installation(location, 'git-sh')


def clone_dotfiles():
    # Current script should be placed on root folder.
    location = '.vim/'
    subprocess.run([
        'git', 'clone',
        'https://github.com/tanducmai/.dotfiles.git', location,
    ])
    os.chdir(location)
    subprocess.Popen([
        'git', 'submodule', 'update',
        '--init', '--recursive', '--remote',
    ])


# ------------------------------- Main Function -------------------------------
if __name__ == '__main__':
    upgrade_packages()
    install_dependencies()
    clone_vim()
    upgrade_packages()
    install_linux_packages()
    install_python_packages()
    clone_git_sh()
    clone_dotfiles()
