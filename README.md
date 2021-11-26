# ~/.vim folder

> **Mastering Vim Build a software development environment with Vim and Neovim (p. 105-6)**

Vim 8 introduced a native way to load plugins, by expecting the files to be in a directory
tree under .vim/pack . Vim 8 expects the following structure of the files:
- `.vim/pack/plugins/opt/` is used for plugins you want to
manually load
- `.vim/pack/plugins/start/` is used for plugins you always
load

In addition, you'll want to add the following two lines to your .vimrc file to load the
documentation for all the plugins:
```bash
packloadall           " Load all plugins."
silent! helptags ALL  " Load help for all plugins."
```

You can manage your plugins yourself (with some overhead) by using Git submodules to
download the plugins and keep them up to date.

Initialize a Git repository in the .vim directory (a one-time step):
```bash
$ cd ~/.vim
$ git init
```

Clone .vim:
```bash
git clone --recursive git://github.com/henry-the-vietnamese/vim.git ~/.vim
```

Add a plugin as a submodule:
```bash
$ git submodule add https://github.com/scrooloose/nerdtree.git pack/plugins/start/nerdtree
$ git commit -m "Add NERDTree plugin."
```

Now, every time you want to update your plugins, you can run the following:
```bash
$ git submodule update --recursive
$ git commit -m "Update plugins."
```

To delete a plugin, remove the submodule with the following steps:
```bash
$ git submodule deinit rails.vim/
$ rm -rf .git/rails.vim
$ git rm -r rails.vim/
" Now the rails.vim/ folder is left with rails.vim/doc/tags"
$ cd doc/tags
$ rm tags
$ cd ..
$ rmdir doc/
$ cd ..
$ rmdir rails.vim/
" Now the complete rails.vim plugin is deleted."
$ git commit -m "Delete rails.vim plugin."
$ git push
```

