# Functions for bash script
# Language: sh

# """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
#              _____ _   _ _   _  ____ _____ ___ ___  _   _ ____
#              |  ___| | | | \ | |/ ___|_   _|_ _/ _ \| \ | / ___|
#              | |_  | | | |  \| | |     | |  | | | | |  \| \___ \
#              |  _| | |_| | |\  | |___  | |  | | |_| | |\  |___) |
#              |_|    \___/|_| \_|\____| |_| |___\___/|_| \_|____/
#
# """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

# ==== FUNCTION ========================================================================
#         NAME: gi
#  DESCRIPTION: Run gitignore.io from the command line with gi
#   PARAMETERS: Operating systems, programming languages and IDE input types
#     EXAMPLES: gi python >> .git/info/exclude
# ======================================================================================
gi () { curl -sL https://www.toptal.com/developers/gitignore/api/$1 ; }


# ==== FUNCTION ========================================================================
#         NAME: pytree
#  DESCRIPTION: Display a tree of files / directories.
#   PARAMETERS: Folder name {optional}
#     EXAMPLES: pytree
#               pytree ~/.vim
# ======================================================================================
pytree () { python ~/.vim/py/tree.py $1; }


# ==== FUNCTION ========================================================================
#         NAME: pydownload
#  DESCRIPTION: URL downloader (like wget or curl).
#   PARAMETERS: URL(s)
#     EXAMPLES: pydownload https://gist.githubusercontent.com/rsvp/3095975/raw/3b663b8c4c821d740dfdaf85011128c49ffec459/tagscrape.sh
# ======================================================================================
pydownload () { python ~/.vim/py/downloader.py $@ ; }


# ==== FUNCTION ========================================================================
#         NAME: pyview
#  DESCRIPTION: Simulate a tree view which loads syntax highlighted code.
#   PARAMETERS: Folder name {optional}
#     EXAMPLES: pydownload https://gist.githubusercontent.com/rsvp/3095975/raw/3b663b8c4c821d740dfdaf85011128c49ffec459/tagscrape.sh
# ======================================================================================
pyview () { python ~/.vim/py/code_viewer.py $1 && rm textual.log ; }


# ==== FUNCTION ========================================================================
#         NAME: pycalc
#  DESCRIPTION: URL downloader (like wget or curl).
#   PARAMETERS: ---
#     EXAMPLES: pycalc
# ======================================================================================
pycalc () { python ~/.vim/py/calculator.py && rm textual.log ; }


# ==== FUNCTION ========================================================================
#         NAME: telcountry
#  DESCRIPTION: Look-up country / telephone code.
#   PARAMETERS: Telephone code / case-sensitive partial country name.
#     EXAMPLES: telcountry 61
#               telcountry Aus
# ======================================================================================
telcountry () {
  echo "Database lookup -> \"$1\"":
  cp ~/.vim/sh/${FUNCNAME} .
  ./${FUNCNAME} $1
  rm ${FUNCNAME}
}


# ==== FUNCTION ========================================================================
#         NAME: git_log
#  DESCRIPTION: Get log of GitHub repo without cloning.
#  PARAMETER 1: GitHub username
#  PARAMETER 2: Repository name
#  PARAMETER 3: -m | -c | -v
#     EXAMPLES: git_log tanducmai dotfiles
#               git_log tanducmai blackjack -c
# ======================================================================================
git_log () {
  cp ~/.vim/sh/${FUNCNAME} .
  ./${FUNCNAME} $1 $2 $3
  rm ${FUNCNAME}
}


# ==== FUNCTION ========================================================================
#         NAME: git_lcm
#  DESCRIPTION: Git script gets last commit date / times
#   PARAMETERS: filename(s)
#     EXAMPLES: git_lcm *.py
#               git_lcm tree.py
#               git_lcm calculator.py code_viewer.py
# ======================================================================================
git_lcm () {
  cp ~/.vim/sh/${FUNCNAME} .
  ./${FUNCNAME} $@
  rm ${FUNCNAME}
}


# ==== FUNCTION ========================================================================
#         NAME: dirt_size
#  DESCRIPTION: Display tree size structure of directory hierarchy.
#  PARAMETER 1: Folder name {optional}
#  PARAMETER 2: Indent_character {default=" "}
#     EXAMPLES: dirt_size /tmp/
#               dirt_size ~/.vim -
#               dirt_size ~/.vim .
# ======================================================================================
dirt_size () {
  cp ~/.vim/sh/${FUNCNAME} .
  ./${FUNCNAME} $1 $2
  rm ${FUNCNAME}
}


# ==== FUNCTION ========================================================================
#         NAME: sort_dict
#  DESCRIPTION: Sort various text files in vim dictionary.
#   PARAMETERS: ---
#     EXAMPLES: sort_dict
# ======================================================================================
sort_dict () {
  echo Finish sorting dictionary ...
  cd ~/.vim/dictionary/sort/
  ./wordlist
  ./spf
  cd ~/.vim
}


# ==== FUNCTION ========================================================================
#         NAME: UPGRADE
#  DESCRIPTION: Upgrade Linux, python, and pip packages.
#   PARAMETERS: ---
#     EXAMPLES: UPGRADE
# ======================================================================================
UPGRADE () {
  clear
  printf "Check for updates to the Operating System ...\n --------------------\n"
  sudo apt update
  sudo apt full-upgrade -y
  sudo apt autoremove -y
  sudo apt autoclean
  printf " --------------------\nCheck for updates to VIM submodules ...\n"
  git -C ~/.vim submodule update --init --recursive --remote
  printf " --------------------\nCheck for updates to PIP package manager ...\n"
  python -m pip install --upgrade pip
  cowsay You are up to date!
}


# ==== FUNCTION ========================================================================
#         NAME: hugolive
#  DESCRIPTION: Keep publishing preview hugo site.
#   PARAMETERS: ---
#     EXAMPLES: hugolive
# ======================================================================================
hugolive () {
  while :; do
    clear
    printf "Wait for the site to be published ...\n--------------------\n"
    hugo server --noHTTPCache --disableFastRender --buildDrafts
  done
}


# ==== FUNCTION ========================================================================
#         NAME: autopep8
#  DESCRIPTION: Format python file(s) according to PEP-8 style
#   PARAMETERS: Python file(s)
#     EXAMPLES: autopep8
# ======================================================================================
pep8 () { printf "Finish formatting ...\n" && autopep8 --in-place -r -a -a $1 ; }


# ==== FUNCTION ========================================================================
#         NAME: gpull
#  DESCRIPTION: Print a message while performing a git pull.
#   PARAMETERS: ---
#     EXAMPLES: gpull
# ======================================================================================
gpull () {
  clear
  printf "Wait for remote content to be fetched from Github ...\n--------------------\n"
  git pull
}


# ==== FUNCTION ========================================================================
#         NAME: gpush
#  DESCRIPTION: Print a message while performing a git push.
#   PARAMETERS: ---
#     EXAMPLES: gpush
# ======================================================================================
gpush () {
  clear
  printf "Wait for the local commits to be pushed to GitHub ...\n--------------------\n"
  git push
}


# ==== FUNCTION ========================================================================
#         NAME: tagscrape
#  DESCRIPTION: Git script gets last commit date / times
#  PARAMETER 1: HTML tag
#  PARAMETER 2: HTML file name | URL (page source)
#     EXAMPLES: ./tagscrape input ~/.vim/html/forms.html
#               ./tagscape b https://readthedocs.org/
# ======================================================================================
tagscrape () {
  cp ~/.vim/sh/${FUNCNAME} .
  ./${FUNCNAME} $1 $2
  rm ${FUNCNAME}
}


# ==== FUNCTION ========================================================================
#         NAME: locate
#  DESCRIPTION: Find files with global and colored extended regex.
#  PARAMETER 1: Extended regex
#  PARAMETER 2: Global pattern
#     EXAMPLES: ./locate txt$
#               ./locate sh$ ~/.vim/sh/
# ======================================================================================
locate () {
  cp ~/.vim/sh/${FUNCNAME} .
  ./${FUNCNAME} $1 $2
  rm ${FUNCNAME}
}


# ==== FUNCTION ========================================================================
#         NAME: country
#  DESCRIPTION: Look up country ISO code or currency symbol.
#  PARAMETER 1: Country name | currency
#  PARAMETER 2: Foreign exchange [fx | $]
#     EXAMPLES: ./country au
#               ./locate us $
# ======================================================================================
country () {
  cp ~/.vim/sh/${FUNCNAME} .
  ./${FUNCNAME} $1 $2
  rm ${FUNCNAME}
}


# ==== FUNCTION ========================================================================
#         NAME: run
#  DESCRIPTION: Run a command multiple times.
#  PARAMETER 1: Times
#   PARAMETERS: Commands
#     EXAMPLES: run 10 echo Hello World!
#               run 5 hugolive
# ======================================================================================
run() {
  number=$1
  shift
  for i in `seq $number`; do
    $@
  done
}
