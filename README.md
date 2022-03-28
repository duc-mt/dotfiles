# Install Vim on Linux

1. Download scripts

```bash
cd ~/ && wget https://raw.githubusercontent.com/tanducmai/.dotfiles/master/install/install.py && wget https://raw.githubusercontent.com/tanducmai/.dotfiles/master/install/postinstall.py
```

2. Change permission

```bash
chmod +x install.py
chmod +x postinstall.py
```

3. Execute scripts

```bash
./install.py
./postinstall.py
rm install.py postinstall.py
```

4. Install vim

```bash
cd /tmp/vim/src/ && make && sudo make install && cd /tmp/ && rm -rf vim/
```

5. Install git-sh

```bash
cd /tmp/git-sh/ && make && sudo make install && cd /tmp/ && rm -rf git-sh/
```

5. Install fzf

```bash
cd ~/.vim/pack/file-system/start/fzf/ && ./install && cd
```

# Work with Submodules

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
