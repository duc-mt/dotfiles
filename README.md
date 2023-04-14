# Personal dotfiles

Do not add anything to your dotfiles if you do not understand what it does.

# License

```text
Copyright (c) <2021> <tanducmai>

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
```

# Clone dotfiles and dotvim repositories

Requirements:

1. `sudo`
1. `git`

```bash
echo "Clone dotfiles and dotvim ..."
git clone https://github.com/tanducmai/dotfiles.git ~/.files
git clone --recursive https://github.com/tanducmai/dotvim.git ~/.vim
echo
```

# Install packages

```bash
sudo chmod +x ~/.files/sh/installer
sudo bash ~/.files/sh/installer
```

# Generate symbolic links

```bash
ln -sf ~/.files/git/gitconfig ~/.gitconfig
ln -sf ~/.files/bash/bashrc ~/.bashrc
ln -sf ~/.files/bash/bash_login ~/.bash_login
ln -sf ~/.files/bash/bash_logout ~/.bash_logout
ln -sf ~/.files/bash/profile ~/.profile
```

# Remove execute permission from install script

```bash
sudo chmod -x ~/.files/sh/installer
```
