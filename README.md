# Linux Initialisation

## Introduction

This `install` script will install Vim, Python, packages, and configuration
files needed to begin a new Linux machine.

Requirements:

1. `wget`
1. `sudo`

## Install

1. Download script

```bash
sudo curl -L https://raw.githubusercontent.com/tanducmai/.dotfiles/master/install -o ~/install
```

2. Change permission

```bash
cd ~/ && sudo chmod +x install
```

3. Execute script

```bash
sudo ./install.py
```
