[![Ubuntu](https://img.shields.io/badge/Ubuntu-E95420?style=for-the-badge\&logo=ubuntu\&logoColor=white)](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions#jobsjob_idruns-on)

# Requirements & Supported Platforms

Targets **Debian-based distributions** (Debian, Kali, Ubuntu) via `apt`,
including Debian-based WSL. It has not been adapted for macOS, Arch, Fedora,
or other package managers -- `install/bootstrap` will not run correctly on
those.

# One-line Boostrap

```bash
bash -c "$(wget -qO- https://raw.githubusercontent.com/duc-mt/dotfiles/master/install/bootstrap)"
```

`install/bootstrap` is a one-shot provisioning script for a brand-new
machine. Answering "Yes" to the "Are you Duke Mai?" prompt additionally
clones private PGP/SSH key repositories and imports encrypted key material
from `doc/private-keys.tgz.enc` -- only answer "Yes" on a machine you intend
to use as yourself. Answering "No" just runs the OS package upgrade.

# Maintaining This Repo

See `CONTRIBUTING.md` for repo layout, conventions, how to run the same
checks CI runs, and step-by-step guides for adding a new alias, function,
or install script.

# Machine-Specific Aliases

Aliases that are personal or platform-specific (hardcoded paths, macOS-only
tools, etc.) don't live in the shared `bash/aliases` file. Instead, copy
`bash/aliases.local.example` to `~/.aliases.local` and edit it -- `bashrc`
sources that file automatically if it exists, and it's gitignored so it
never gets committed.

# Reporting Issues

You can send an encrypted email to `ducmai.network@gmail.com` using the
following PGP key:

> D2F1 F373 9A4E 465E 737C 1F38 F9E9 1488 183E D044 
