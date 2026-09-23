# Duke's Dotfiles

[![Ubuntu](https://img.shields.io/badge/Ubuntu-E95420?style=for-the-badge&logo=ubuntu&logoColor=white)](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions#jobsjob_idruns-on)

A comprehensive, automated dotfiles and system provisioning setup tailored for Debian-based systems.

## 📋 Requirements & Supported Platforms

Targets **Debian-based distributions** (Debian, Kali, Ubuntu) via `apt`, including Debian-based WSL. 

> **Note:** It has not been adapted for macOS, Arch, Fedora, or other package managers. The `install/bootstrap` script will not run correctly on those platforms.

## 🚀 One-Line Bootstrap

To provision a brand-new machine, run the following one-liner:

```bash
bash -c "$(wget -qO- https://raw.githubusercontent.com/duc-mt/dotfiles/master/install/bootstrap)"
```

`install/bootstrap` is a one-shot provisioning script. 
- Answering **"Yes"** to the *"Are you Duc Mai?"* prompt clones private PGP/SSH key repositories and imports encrypted key material from `doc/private-keys.tgz.enc`. **Only answer "Yes" on a machine you intend to use as yourself.** 
- Answering **"No"** safely skips the private identity configuration and just runs the OS package upgrades and tool installations.

### Unattended Installation

To run the bootstrap script fully unattended (without any prompts), set the `BOOTSTRAP_ANSWER` environment variable before execution:

```bash
BOOTSTRAP_ANSWER=No bash install/bootstrap
```

> **Note:** `sudo` will still ask for your password once at the very start (unless passwordless sudo is already configured). After that, credentials are cached and refreshed automatically for the rest of the run. 
> 
> If you use `BOOTSTRAP_ANSWER=Yes`, the private-repo clones will fail fast (not hang) if Git doesn't already have credentials for them. Ensure you set up a credential helper or SSH-based auth beforehand if you want that path to complete unattended.

## 💻 Machine-Specific Aliases

Aliases that are personal or platform-specific (hardcoded paths, macOS-only tools, etc.) don't live in the shared `bash/aliases` file. 

Instead, copy `bash/aliases.local.example` to `~/.aliases.local` and edit it. The `bashrc` sources that file automatically if it exists, and it's gitignored so it never gets accidentally committed.

## 🛠️ Maintaining This Repo

See [CONTRIBUTING.md](CONTRIBUTING.md) for the repository layout, conventions, how to run the CI checks locally, and step-by-step guides for adding a new alias, function, or install script.

## 🐛 Reporting Issues

You can send an encrypted email to `ducmai.network@gmail.com` using the following PGP key fingerprint:

> `D2F1 F373 9A4E 465E 737C 1F38 F9E9 1488 183E D044`
