# ~/.vim folder

Setting up Vim on Linux.

```bash
git clone https://github.com/vim/vim.git /tmp/vim/ && cd /tmp/vim/src/ && make && sudo make install && cd
```

If issues occur, it might be that some dependencies are missing. Try:

```bash
sudo apt update && sudo apt full-upgrade -y && sudo apt install -y make build-essential libncurses5-dev git
```

---

Some initial, useful packages to be installed:

```bash
sudo apt update && sudo apt full-upgrade -y && sudo apt install -y tree figlet hugo fzf python3 python3-pip python3-autopep8 python3-pytest pandoc texlive-latex-extra sqlformat python3-q-text-as-data net-tools ipcalc vsftpd nethogs nmap aircrack-ng fd-find mlocate
```

Python packages to be installed:

```bash
python3 -m pip install -U mypy starcli
```

Setting up git-sh on Linux.

```bash
git clone https://github.com/rtomayko/git-sh.git /tmp/git-sh/ && cd /tmp/git-sh/ && make && sudo make install && cd
```

---

Clone .vim with all of its submodules:

```bash
git clone https://github.com/tanducmai/.dotfiles.git ~/.vim && cd ~/.vim
git submodule update --init --recursive --remote
```

Create symbolic links:

```bash
ln -sf ~/.vim/vimrc ~/.vimrc
ln -sf ~/.vim/gitconfig ~/.gitconfig
ln -sf ~/.vim/bashrc ~/.bashrc
ln -s $(which fdfind) ~/.local/bin/fd
```

The last command is to support the use of FZF.

Add a plugin as a submodule:

```bash
git submodule add https://github.com/preservim/nerdtree pack/plugins/start/nerdtree
```

To update all the plugins:

```bash
cd ~/.vim && git submodule foreach git pull origin master
```

To remove a plugin:

```bash
cd ~/.vim && git submodule deinit -f -- pack/plugins/start/nerdtree
rm -rf .git/modules/pack/plugins/start/nerdtree
git rm -f pack/plugins/start/nerdtree
```
