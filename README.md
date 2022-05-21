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

# Introduction

The `install` and `postinstall` script will install Vim, Python, packages, and
configuration files (. files) needed to get the show on the road.

Requirements:

1. `sudo`
1. `curl`
1. `wget`

# install

1. Download script

```bash
sudo curl -L https://raw.githubusercontent.com/tanducmai/dotfiles/master/sh/install -o ~/install
```

2. Change permission

```bash
cd ~/ && sudo chmod +x install
```

3. Execute script

```bash
sudo ./install
```

# postinstall

1. Download script

```bash
sudo curl -L https://raw.githubusercontent.com/tanducmai/dotfiles/master/sh/postinstall -o ~/postinstall
```

2. Change permission

```bash
cd ~/ && sudo chmod +x postinstall
```

3. Execute script

```bash
sudo ./postinstall
```
