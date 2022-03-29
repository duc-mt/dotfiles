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
