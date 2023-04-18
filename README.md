# Table of Contents

1. [Install WSL utilities](install-wsl-utilities)
    1. [Ubuntu](#ubuntu)
    1. [Debian](#debian)
    1. [Kali Linux](#kali-linux)
1. [Clone dotfiles and dotvim](#clone-dotfiles-and-dotvim)
1. [Run installer](#run-installer)
1. [Generate symlinks](#generate-symlinks)
1. [Clean up installation](#clean-up-installation)

# Install WSL utilities ...

## Ubuntu

```bash
sudo add-apt-repository ppa:wslutilities/wslu
sudo apt update
sudo apt install wslu
```

## Debian

```bash
sudo apt install gnupg2 apt-transport-https
wget -O - https://pkg.wslutiliti.es/public.key | \
  sudo tee -a /etc/apt/trusted.gpg.d/wslu.asc
echo "deb https://pkg.wslutiliti.es/debian buster main" | \
  sudo tee -a /etc/apt/sources.list
sudo apt update
yes | sudo apt install wslu
```

## Kali Linux

```bash
sudo apt install gnupg2 apt-transport-https
wget -O - https://pkg.wslutiliti.es/public.key | \
  sudo tee -a /etc/apt/trusted.gpg.d/wslu.asc
echo "deb https://pkg.wslutiliti.es/kali kali-rolling main" | \
  sudo tee -a /etc/apt/sources.list
sudo apt update
yes | sudo apt install wslu
```

# Clone dotfiles and dotvim

```bash
echo Clone dotfiles ...
git clone --recursive https://github.com/tanducmai/dotfiles.git ~/.files
echo
echo Clone dotvim ...
git clone --recursive https://github.com/tanducmai/dotvim.git ~/.vim
```

# Run installer

```bash
chmod +x ~/.files/sh/installer
sudo bash ~/.files/sh/installer
```

# Generate symlinks

```bash
ln -sf ~/.files/git/gitconfig ~/.gitconfig
ln -sf ~/.files/bash/bashrc ~/.bashrc
ln -sf ~/.files/bash/bash_login ~/.bash_login
ln -sf ~/.files/bash/bash_logout ~/.bash_logout
ln -sf ~/.files/bash/profile ~/.profile
```

# Clean up installation

```bash
chmod -x ~/.files/sh/installer
```
