# Install Vim on Linux

1. Run install/install.py Script

2. Install Submodules

```bash
cd ~/.vim && git submodule update --init --recursive --remote
```
3. Run install/postinstall.py Script

4. Install Vim

```bash
cd /tmp/vim/src/ && make && sudo make install && cd /tmp/ && rm -rf vim/ && cd
```

5. Install Git-sh

```bash
cd /tmp/git-sh/ && make && sudo make install && cd /tmp/ && rm -rf git-sh/ && cd
```

6. Install FZF

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
