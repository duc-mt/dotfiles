# Work with Submodules

Add a submodule

```bash
git submodule add https://github.com/preservim/nerdtree pack/plugins/start/nerdtree
```

Update every submodule

```bash
cd ~/.vim && git submodule foreach git pull --all
```

Remove a submodule

```bash
cd ~/.vim
git submodule deinit -f pack/plugins/start/nerdtree
git rm -f pack/plugins/start/nerdtree
rm -rf .git/modules/pack/plugins/start/nerdtree
```

See the list of submodules in a superproject

```bash
git submodule status
```
