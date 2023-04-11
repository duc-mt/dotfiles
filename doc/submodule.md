# Add a submodule

```bash
git submodule add \
    https://github.com/preservim/nerdtree \
    pack/plugins/start/nerdtree
```

# Update every submodule within the current repository

```bash
git submodule update --init --recursive --remote
```

# Remove a submodule

```bash
cd ~/.vim
git submodule deinit -f pack/plugins/start/nerdtree
git rm -r pack/plugins/start/nerdtree
rm -rf .git/modules/pack/plugins/start/nerdtree
```

# Show the status of existing submodules

```bash
git submodule
```

# Clone a repository including all of its submodules

```bash
git clone --recursive \
    https://github.com/tanducmai/dotvim ~/.vim
```

# Resolve "already exists in the index" fatal error

```bash
rm -rf path/to/project-folder
git rm -r --cached path/to/project-folder
```
