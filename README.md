# Installing up Vim on Linux

1. Install dependencies

```bash
sudo apt update && sudo apt full-upgrade -y && sudo apt install -y make build-essential libncurses5-dev git
```

2. Clone and install Vim

```bash
git clone https://github.com/vim/vim.git /tmp/vim/ && cd /tmp/vim/src/ && make && sudo make install && cd /tmp/ && rm -rf vim/ && cd
```

---

3. Install some Linux packages

```bash
sudo apt update && sudo apt full-upgrade -y && sudo apt install -y tree figlet hugo fzf python3 python3-pip pandoc texlive-latex-extra sqlformat python3-q-text-as-data net-tools ipcalc vsftpd nethogs nmap aircrack-ng fd-find mlocate
```

4. Install some Python packages

```bash
python3 -m pip install --user --upgrade mypy starcli rich bs4 pygame autopep8 pytest
```

5. Set up git-sh on Linux

```bash
git clone https://github.com/rtomayko/git-sh.git /tmp/git-sh/ && cd /tmp/git-sh/ && make && sudo make install && cd /tmp/ && rm -rf git-sh/ && cd
```

# Cloning .dotfiles

6. Clone from Github

```bash
git clone https://github.com/tanducmai/.dotfiles.git ~/.vim && cd ~/.vim && git submodule update --init --recursive --remote
```

7. Create symbolic links

```bash
ln -sf ~/.vim/vimrc ~/.vimrc && ln -sf ~/.vim/gitconfig ~/.gitconfig && ln -sf ~/.vim/bashrc ~/.bashrc && ln -s $(which fdfind) ~/.local/bin/fd
```

The last command helps run FZF in the terminal.

8. Set up FZF in Vim

```bash
cd ~/.vim/pack/file-system/start/fzf/ && ./install && cd
```

# Working with Submodules

Add a plugin as a submodule

```bash
git submodule add https://github.com/preservim/nerdtree pack/plugins/start/nerdtree
```

Update every plugin

```bash
cd ~/.vim && git submodule foreach git pull origin master
```

Remove a plugin

```bash
cd ~/.vim && git submodule deinit -f -- pack/plugins/start/nerdtree
rm -rf .git/modules/pack/plugins/start/nerdtree
git rm -f pack/plugins/start/nerdtree
```
