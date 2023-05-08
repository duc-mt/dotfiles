# Table of Contents

1. [Clone dotfiles and dotvim](#clone-dotfiles-and-dotvim)
1. [Run installer](#run-installer)
1. [Generate symlinks](#generate-symlinks)
1. [Clean up installation](#clean-up-installation)

# Clone dotfiles and dotvim

```bash
git clone --recursive https://github.com/tanducmai/dotfiles.git ~/.files
git clone --recursive https://github.com/tanducmai/dotvim.git ~/.vim
```

# Run installer

```bash
chmod 777 ~/.files/sh/installer
bash ~/.files/sh/installer
```

# Generate symlinks

```bash
ln -sfv ~/.files/git/gitconfig ~/.gitconfig
ln -sfv ~/.files/bash/bashrc ~/.bashrc
ln -sfv ~/.files/bash/bash_login ~/.bash_login
ln -sfv ~/.files/bash/bash_logout ~/.bash_logout
ln -sfv ~/.files/bash/bash_profile ~/.bash_profile
ln -sfv ~/.files/bash/selected_editor ~/.selected_editor
ln -sfv ~/.files/bash/ondirrc ~/.ondirrc
```

# Clean up installation

```bash
chmod 644 ~/.files/sh/installer
```
