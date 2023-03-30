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
#         NAME: pycalc
#  DESCRIPTION: URL downloader (like wget or curl).
#   PARAMETERS: ---
#     EXAMPLES: pycalc
# ======================================================================================
pycalc () { python ~/.files/py/calculator.py && rm textual.log ; }


# ==== FUNCTION ========================================================================
#         NAME: pyview
#  DESCRIPTION: Simulate a tree view which loads syntax highlighted code.
#   PARAMETERS: Folder name {optional}
#     EXAMPLES: pydownload https://gist.githubusercontent.com/rsvp/3095975/raw/3b663b8c4c821d740dfdaf85011128c49ffec459/tagscrape.sh
# ======================================================================================
pyview () { python ~/.files/py/code_viewer.py $1 && rm textual.log ; }


# ==== FUNCTION ========================================================================
#         NAME: pydownload
#  DESCRIPTION: URL downloader (like wget or curl).
#   PARAMETERS: URL(s)
#     EXAMPLES: pydownload https://gist.githubusercontent.com/rsvp/3095975/raw/3b663b8c4c821d740dfdaf85011128c49ffec459/tagscrape.sh
# ======================================================================================
pydownload () { python ~/.files/py/downloader.py $@ ; }


# ==== FUNCTION ========================================================================
#         NAME: pytree
#  DESCRIPTION: Display a tree of files / directories.
#   PARAMETERS: Folder name {optional}
#     EXAMPLES: pytree
#               pytree ~/.vim
# ======================================================================================
pytree () { python ~/.files/py/tree.py $1; }


# ==== FUNCTION ========================================================================
#         NAME: sort_dict
#  DESCRIPTION: Sort various text files in vim dictionary.
#   PARAMETERS: ---
#     EXAMPLES: sort_dict
# ======================================================================================
sort_dict () {
  find ~/.vim/dictionary/sort -type f -exec . {} \;
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


# ==== FUNCTION ========================================================================
#         NAME: repl
#  DESCRIPTION: Find and replace a pattern for every file (results of the regrex search)
#               under the current directory.
#  PARAMETER 1: Regular expression
#  PARAMETER 2: Pattern to be searched
#  PARAMETER 3: Replacement
#     EXAMPLES: repl *.md color colour
#               repl *.txt learned learnt
# ======================================================================================
repl () {
  echo ---------------
  echo Every instance of [$2] in files matching [$1] will be replaced with [$3].
  echo ---------------
  find . -type f -name "$1" -exec sed -i "s/$2/$3/g" {} \;
}
