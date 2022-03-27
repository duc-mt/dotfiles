#!/usr/bin/python3

"""This is the first script to run after installing Linux."""

# ------------------------------- Module Import -------------------------------
import subprocess


# ------------------------------- Named Constant ------------------------------
SUDO = ['sudo', 'apt']


# ---------------------------- Function Definitions ---------------------------
def upgrade_packages():
    subprocess.run(SUDO + ['update'])
    subprocess.run(SUDO + ['full-upgrade', '-y'])


def install_dependencies():
    command = SUDO + ['install', '-y']
    packages = ['make', 'build-essential', 'libncurses5', 'git']
    subprocess.run(command + packages)


def perform_installation(name):
    subprocess.run(['make'])
    subprocess.run(['sudo', 'make', 'install'])
    subprocess.run(['cd', '/tmp/'])
    subprocess.run(['rm', '-rf', name + '/'])
    subprocess.run(['cd'])


def clone_vim():
    location = '/tmp/vim/'
    subprocess.run([
        'git', 'clone',
        'https://github.com/vim/vim.git', 'location',
    ])
    subprocess.run(['cd', location + 'src/'])
    perform_installation('vim')


def install_linux_packages():
    command = SUDO + ['install', '-y']
    packages = [
        'tree', 'figlet', 'hugo', 'python3', 'python3-pip', 'pandoc',
        'texlive-latex-extra', 'sqlformat', 'python3-q-text-as-data',
        'net-tools', 'ipcalc', 'vsftpd', 'nethogs', 'nmap', 'aircrack-ng',
        'fd-find', 'mlocate',
    ]
    subprocess.run([command + packages])


def install_python_packages():
    command = ['python3', '-m', 'pip', 'install', '--user', '--upgrade']
    packages = [
        'mypy', 'starcli', 'rich', 'bs4', 'pygame', 'autopep8', 'pytest'
    ]
    subprocess.run([command + packages])


def install_git_sh():
    location = '/tmp/git-sh/'
    subprocess.run([
        'git', 'clone',
        'https://github.com/rtomayko/git-sh.git', 'location',
    ])
    subprocess.run(['cd', location])
    perform_installation('git-sh')


def clone_dotfiles():
    location = '~/.vim'
    subprocess.run([
        'git', 'clone',
        'https://github.com/tanducmai/.dotfiles.git', 'location',
    ])
    subprocess.run(['cd', location])
    subprocess.run(['git', 'submodule', 'update'])
    subprocess.run([
        'git', 'submodule', 'update',
        '--init', '--recursive', '--remote',
    ])


def generate_symbolic_links():
    command = ['ln', '-sf']
    mappings = {
        '~/.vim/vimrc': '~/.vimrc',
        '~/.vim/bashrc': '~/.bashrc',
        '~/.vim/git/gitconfig': '~/.gitconfig',
        '$(which fdfind)': '~/.local/bin/fd',
    }
    for target, link_name in mappings.items():
        # Create a link to target with the name link_name.
        subprocess.run([command + list(target) + list(link_name)])


def install_fzf():
    directory = '~/.vim/pack/file-system/start/fzf/'
    subprocess.run(['cd', 'directory'])
    subprocess.run(['./install'])
    subprocess.run(['cd'])


# ------------------------------- Main Function -------------------------------
if __name__ == '__main__':
    upgrade_packages()
    install_dependencies()
    clone_vim()
    upgrade_packages()
    install_linux_packages()
    install_python_packages()
    install_git_sh()
    clone_dotfiles()
    generate_symbolic_links()
    install_fzf()
