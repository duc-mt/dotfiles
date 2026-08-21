# Maintaining and Extending This Repo

A reference for future-you (or anyone else) on how this repo is organized,
the conventions it follows, and how to add things without breaking what's
already there. See `README.md` for setup; this file is about ongoing
maintenance.


## Layout

| Path | What goes here |
|---|---|
| `bash/` | Interactive shell config: `bashrc`, `bash_profile`, `aliases`, `functions`, `pathrc`, `glob_variables` -- sourced every shell session |
| `bin/` | Personal scripts, added to `$PATH` via `pathrc`. Executable (`chmod +x`) |
| `install/` | One-shot machine-provisioning scripts, run via `bootstrap`. **Not** executable -- see below |
| `git/` | `gitconfig`, commit template, global gitignore -- symlinked into place by `bootstrap`, not sourced by bash |
| `py/` | Python utility scripts and submodules |
| `doc/` | Reference material and third-party submodules (cheat sheets, wordlists) |
| `.github/workflows/` | CI: `shellcheck.yml`, `py-codestyle.yml`, `sync-submodules.yml` |

A fact about you or your setup goes in `bash/glob_variables` (environment
variables) or `bash/aliases`/`bash/functions` (behavior). A fact that's
*this machine only* goes in `~/.aliases.local`, never in the shared files
(see "Machine-specific config" below).


## Before you push: run this

```bash
# Syntax check whatever you touched
bash -n path/to/file

# Lint it -- .shellcheckrc at the repo root applies automatically,
# no flags needed, from any subdirectory
shellcheck path/to/file

# If you touched git/gitconfig, confirm it still parses
git config --file git/gitconfig --list >/dev/null && echo OK

# If you touched a .github/workflows/*.yml, confirm it's valid YAML
python3 -c "import yaml; yaml.safe_load(open('.github/workflows/whatever.yml'))"
```

CI now runs `shellcheck` on every push (`.github/workflows/shellcheck.yml`),
gated at `--severity=warning`, across everything in `bash/`, `bin/`, and
`install/`. Running it locally first means no surprises after you push --
and it's usually faster to fix things before CI tells you, since your local
run has the exact same config as CI (same root `.shellcheckrc`, same
severity threshold).

If shellcheck flags something you're confident is a false positive, disable
that specific check for that specific line with a `# shellcheck disable=SCxxxx`
comment directly above it, with a short reason -- not by weakening
`.shellcheckrc` for everyone.


## Conventions

**Tool-replacing aliases must guard on the tool's existence.**
If an alias replaces a coreutil with something fancier (`cat` → `lolcat`,
`ls` → `exa`), it must not fire unless the tool is actually installed --
otherwise the alias either breaks outright or, worse, silently no-ops and
gives you the *plain* command when you were expecting different behavior
(this bit `rm` → `trash` specifically: if `trash` isn't installed, you get
plain `rm` with no warning). Pattern:

```bash
[[ -x "$(command -v toolname)" ]] && alias name='toolname'
```

**Every optional integration in `bashrc`/`bash_profile` must be guarded,
never assumed present.** `starship`, `rbenv`, `dbus-launch`, `fortune`,
`cargo` -- none of these are guaranteed to exist on a given machine. Check
first (`command -v`, `[[ -x ... ]]`, `[[ -f ... ]]`), then act. An
unconditional call breaks *every* login shell on any machine missing that
one tool.

**`install/*` scripts are not executable, by convention -- called via `bash
install/name`, never `./install/name`.** This isn't an oversight; it's how
`run_install_script` in `bootstrap` invokes them. Keep new ones consistent
(`chmod -x` after creating).

**Never `chmod 777` anything.** If something needs to be executable by
other users on the system, `755` does that without also being writable by
them. `777` on anything living in a shared path (`/usr/local/bin`,
`/etc/...`, pass extensions) is a standing local-privilege risk, not a
convenience.

**Downloading and building third-party code as part of `install/*` should
verify what it can.** If upstream publishes a signed release (a documented
GPG key, a signed git tag, a `.sig`/`.asc` alongside the tarball) -- verify
it before `make install`, the way `install_gnupg` and the `password-store`/
`pass-update` sections of `install_pass` do. If upstream doesn't publish
anything verifiable, say so in a comment next to the `git clone` (see the
note in `install_pass` above the unverified extensions) rather than silently
building an unverified tarball as if it were checked.

**Shared logic goes in `bash/functions`, not copy-pasted across aliases.**
If you're about to write a third near-identical alias that does
commit→pull→push, or three near-identical `install_*` blocks -- stop and
extract a function/script instead (see `git_publish()` in `bash/functions`,
or how `install_wordlists` consolidates what used to be two separate
inline blocks in `bootstrap`).

**`git commit` in an automated script should tolerate "nothing to commit."**
Under `set -e`, a commit step with nothing staged aborts the whole script.
Wrap it: `git commit -m "..." || true`, then let the following `git push`
be the thing that actually fails loudly if something's wrong.

**Header format for new `install/*` scripts** -- copy an existing one
(`install_whatmask` is the shortest example) and keep the block:

```bash
#!/usr/bin/env bash

# ======================================================================================
#
#         FILE:  install_whatever
#       AUTHOR:  <you>
#      COMPANY:  ---
#        USAGE:  ./install_whatever
#  DESCRIPTION:  <one line>
#      CREATED:  <date>
#
# ======================================================================================
```


## Machine-specific config

Anything that only makes sense on *this* machine -- a hardcoded personal
path, an OS-specific alias (macOS-only, WSL-only) -- goes in
`~/.aliases.local`, not `bash/aliases`. Copy the template:

```bash
cp bash/aliases.local.example ~/.aliases.local
```

`bashrc` sources it automatically if it exists, and it's gitignored, so it
never ends up committed. If you're tempted to add an `if [[ "$(uname)" =
"Darwin" ]]` branch to a shared alias file instead -- put it in
`~/.aliases.local` on the relevant machine instead. Shared files should
work the same way on every machine that clones this repo; per-machine
differences belong outside them.


## Adding a new alias or function

1. Does it depend on a tool that might not be installed? Guard it
   (`command -v`/`-x`).
2. Is it genuinely shared across machines, or specific to this one? Shared
   → `bash/aliases` or `bash/functions`. Specific → `~/.aliases.local`.
3. Is there already something close to this (a `git_publish`-shaped
   pattern, an existing alias doing 80% of it)? Extend/reuse rather than
   duplicate.
4. `shellcheck bash/aliases` (or `functions`) before committing.


## Adding a new `install/*` script

1. Copy the header block from an existing script.
2. `chmod -x install/your_script` (matches the existing convention).
3. If it builds something from source or installs a third-party tool:
   check whether upstream publishes a signed release. If yes, verify it
   (see `install_gnupg`/`install_pass` for the pattern). If no, say so in a
   comment.
4. No `chmod 777` on anything it installs.
5. Add the `log_task "..."` + `run_install_script "your_script"` call to
   `bootstrap` at the point in the sequence where it belongs -- don't
   reorder existing steps unless you've checked nothing later depends on
   what ran before it.
6. `bash -n install/your_script && shellcheck install/your_script`.


## CI

- **`shellcheck.yml`** -- lints every shell script in `bash/`, `bin/`,
  `install/` on every push, using the root `.shellcheckrc`. This is the
  main safety net for exactly the kind of bug that's easy to miss reading
  code by eye (broken `awk`/regex syntax, unquoted variables, masked
  return values).
- **`py-codestyle.yml`** -- lints Python under `py/`.
- **`secret-scan.yml`** -- runs `gitleaks` against full git history on
  every push, catching accidentally-committed credentials before they sit
  in history forever. Public identifiers that happen to look like secrets
  (GPG fingerprints, key IDs) are annotated inline with
  `# gitleaks:allow` on their *current* line -- but `gitleaks git` scans
  every historical commit's actual content, so an inline annotation only
  suppresses the finding from the commit it was added in onward, not
  retroactively. Historical occurrences that predate an annotation need an
  exact-fingerprint entry in `.gitleaksignore` instead (confirmed by
  testing both mechanisms against real trigger patterns before relying on
  them). Vendored/bundled third-party content too voluminous to review
  file-by-file (e.g. `pack/vscode-extensions/` -- committed VS Code
  extension bundles, not this repo's own code) is excluded by path in
  `.gitleaks.toml` instead of individually allowlisted.
- **`config-lint.yml`** -- `yamllint` (using the tailored root
  `.yamllint.yml` -- default yamllint flags GitHub Actions' own `on:` key
  as an invalid boolean, so don't use plain defaults for workflow YAML),
  `actionlint` (a materially stronger check than plain YAML syntax --
  it understands Actions expressions/contexts and also runs shellcheck
  against embedded `run:` blocks), TOML validation (`bash/starship.toml`,
  via Python's built-in `tomllib`, no new dependency), and `gitconfig`
  validation.
- **`commit-lint.yml`** -- validates PR commit subject lines against the
  types/scopes declared in `commit_convention.yaml` (default angular-style
  types, since `commit_types` is currently omitted from that file -- see
  its own comments). Merge and revert commits are skipped automatically.
  The actual check lives in `.github/scripts/validate_commit.py` if you
  need to adjust the matching logic.
- **`smoke-test.yml`** -- actually *runs* `install/bootstrap` in a fresh
  `debian:bookworm` container (answering "2" -- bootstrap's first prompt
  is a `select` menu, which reads the option's number, not its text -- to
  choose "No" and skip the private-key provisioning branch, which needs
  real credentials this container will never have). This is the only
  workflow that tests *execution* rather than *appearance* -- static
  analysis (shellcheck, flake8) can't catch a typo'd package name or a
  function called before it's defined, this can. It's genuinely heavy
  (~140 package installs, tens of minutes), so it runs weekly + on manual
  dispatch, not on every push. Three things worth knowing about how it
  works:
  - **Isolated `HOME`/XDG dirs, pointed at the checkout.** `bootstrap`
    derives `DOTFILES` as `"${HOME}/.files"` internally, so every
    `run_install_script` call needs that path to resolve to real content
    -- this job sets `HOME` to a fresh temp dir and symlinks
    `${HOME}/.files` to `$GITHUB_WORKSPACE`, which does both isolation and
    correctness in one step. An earlier version of this workflow didn't do
    this and would have silently tested far less than it looked like it
    did.
  - **Errors are surfaced, not left in a log file.**
    `run_install_script` redirects each `install_*` script's stderr to
    `/tmp/install-script-error.txt` and never checks the exit code --
    `bootstrap` itself doesn't fail if one of those scripts breaks. This
    job explicitly checks that file after each run and fails loudly if
    it's non-empty.
  - **`install_gnupg`/`install_pass` are not exercised** -- both are
    commented out in `bootstrap`'s own `run_install_script` calls (a
    pre-existing choice in this repo, not something this test controls),
    so this covers ~140 package installs and whichever `install_*` scripts
    *are* currently wired up, not literally everything in `install/`.
  - **Idempotency**: bootstrap runs a second time after the first
    succeeds, on the theory that it should be safe to re-run (it `rm -rf`s
    most destinations before cloning into them) -- nothing enforced that
    until now.
- **`polyglot-lint.yml`** -- one job per language this repo doesn't use
  yet (Zsh, Fish, Lua, Ruby, Perl, Makefile, Terraform, Ansible,
  Dockerfile, Nushell, PowerShell, HTML), each finding files of its type
  first and exiting cleanly with "no files found" if there aren't any.
  Every job is a no-op today except **HTML** -- `html/forms.html` is a
  real, pre-existing file, and `tidy` currently flags real issues in it
  (a deprecated `<center>` element, an unclosed `</form>`). This job will
  fail on push until that file is fixed or the job's strictness is
  deliberately relaxed -- see the note in the PR/commit that added this
  workflow for the specifics; I didn't touch the file's content, since it
  looked like a personal reference/scratch file rather than something to
  silently "fix" without being asked.
- **`sync-submodules.yml`** -- nightly cron that updates the `doc/`
  submodules and pushes the result. This job has `contents: write`; it's
  the only workflow that does.
- **`docs-lint.yml`** -- checks `README.md`/`CONTRIBUTING.md` for broken
  links via `lychee`. Two known false-positive sources are handled
  differently on purpose: `docs.github.com` gets rate-limited without a
  token (lychee auto-detects `GITHUB_TOKEN`, which Actions provides for
  free -- this is lychee's own documented fix, not independently
  re-verified against a live token outside of Actions since none was
  available while building this); `img.shields.io` badges reject
  non-browser requests inconsistently regardless of token, so that domain
  is excluded outright -- verified locally that without the exclusion, a
  live, working badge URL fails the check.

Both `checkout`/`setup-python` actions are pinned to a commit SHA, not a
branch (`@main` is mutable and a workflow with push access is a real
target). `.github/dependabot.yml` keeps those pins current automatically --
it bumps the SHA to match new releases on a weekly schedule, it never
switches a pin back to an unpinned branch reference. When bumping an action
manually instead, copy the new SHA from the release's own GitHub page, not
from memory -- and note the version as a trailing comment the way the
existing pins do.

**Two different things are pinned in this repo, and only one of them is
covered by the above.** `uses: owner/repo@SHA` lines in workflow YAML
(`actions/checkout`, `actions/setup-python`, `hashicorp/setup-terraform`,
`terraform-linters/setup-tflint`) are what Dependabot's `github-actions`
ecosystem actually watches -- those stay current automatically. But several
tools are installed by downloading a specific version directly inside a
`run:` step (`gitleaks` in `secret-scan.yml`, `actionlint` in
`config-lint.yml`, `checkmake`/`hadolint`/`nushell` in
`polyglot-lint.yml`) -- Dependabot has no visibility into a version string
sitting in an `env:` block, so those pins would go stale silently forever
without something else watching them. `check-pinned-versions.yml` is that
something else: it runs weekly, compares each pin against the tool's actual
latest release, and opens (or updates) a single tracking issue if anything
is behind -- it deliberately does *not* auto-bump the version itself, since
that would mean trusting a new upstream release with no one looking at what
changed. The comparison logic lives in
`.github/scripts/check_pinned_versions.py` if you add another tool that
needs the same treatment.

The `pass`/`pass-update` version pins in `install/install_pass` are a third
category on purpose: they're tied to a specific signed release verified
against a hardcoded GPG fingerprint (see the Security section of the
original audit). Bumping either version means re-verifying the *new*
release's signature, not just changing a number -- that one should stay a
manual, deliberate edit, and isn't included in the automated check above.

**A caveat worth knowing, in the interest of not overstating confidence:**
every tool in `polyglot-lint.yml` except PowerShell's `PSScriptAnalyzer`
was installed and run directly against real good/bad test files before
this workflow shipped -- not assumed to work from documentation. PSScriptAnalyzer
is the one exception (`pwsh` isn't available in the environment these
workflows were developed in), so that job is sourced from GitHub's own
documented pattern but hasn't been independently exercised the way
everything else here has. Same for `terraform fmt`/`validate` specifically
(as opposed to `tflint`, which *was* tested directly) -- `hashicorp/setup-terraform`
is pinned to a real, verified release SHA, but the Terraform CLI itself
wasn't available to test locally.

### Using these workflows from another repo

`shellcheck.yml` and `py-codestyle.yml` both declare `workflow_call`
inputs, so another repo can call them directly instead of copying the
YAML:

```yaml
# .github/workflows/lint.yml in some other repo
jobs:
  shellcheck:
    uses: duc-mt/dotfiles/.github/workflows/shellcheck.yml@master
    with:
      paths: "scripts lib"     # defaults to "bash bin install"
      severity: "warning"      # defaults to "warning"

  python:
    uses: duc-mt/dotfiles/.github/workflows/py-codestyle.yml@master
    with:
      path: "src"              # defaults to "."
      python-version: "3.13"   # defaults to "3.14"
```

Two things worth knowing before relying on this:

- **Pin to a commit SHA, not `@master`,** for the same reason this repo
  pins its own Action dependencies -- `@master` is a moving target another
  person's push can change under you.
- **`shellcheck.yml` picks up whichever `.shellcheckrc` sits at the calling
  repo's root** (shellcheck's own auto-discovery, not something this
  workflow controls) -- if the calling repo doesn't have one, it lints
  with shellcheck's defaults instead of this repo's conventions.

`secret-scan.yml` and `sync-submodules.yml` aren't meant to be called
externally -- the former has no inputs to adjust its scope, and the latter
is tied to this repo's specific submodule layout.


## What's still a known gap

The private-key provisioning flow in `bootstrap`
(`doc/private-keys.tgz.enc`, the `pgp-keys`/`ssh-keys` clones) hasn't been
redesigned yet. Don't extend that pattern for anything else; treat it as
something to be replaced, not a template to copy.
