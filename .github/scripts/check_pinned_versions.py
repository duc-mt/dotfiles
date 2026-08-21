#!/usr/bin/env python3
"""
Checks the hardcoded tool versions pinned inside this repo's CI workflows
against each tool's actual latest GitHub release, and reports which ones
are stale.

These are NOT the same as `uses: owner/repo@SHA` lines in workflow YAML --
those are already tracked automatically by Dependabot (see
.github/dependabot.yml). This script exists specifically for versions
pinned as env vars inside `run:` steps (gitleaks, actionlint, checkmake,
hadolint, nushell), which Dependabot's github-actions ecosystem has no
visibility into at all.

Usage: python3 check_pinned_versions.py
Exits 1 if anything is stale (so the workflow calling this can decide what
to do -- e.g. open an issue), 0 if everything is current.
"""
import re
import sys
import urllib.request
import urllib.error

# tool name -> (repo, file containing the pin, exact env-var line to match)
PINS = {
    "gitleaks": (
        "gitleaks/gitleaks",
        ".github/workflows/secret-scan.yml",
        r'GITLEAKS_VERSION:\s*"([^"]+)"',
    ),
    "actionlint": (
        "rhysd/actionlint",
        ".github/workflows/config-lint.yml",
        r'ACTIONLINT_VERSION:\s*"([^"]+)"',
    ),
    "checkmake": (
        "checkmake/checkmake",
        ".github/workflows/polyglot-lint.yml",
        r'CHECKMAKE_VERSION:\s*"([^"]+)"',
    ),
    "hadolint": (
        "hadolint/hadolint",
        ".github/workflows/polyglot-lint.yml",
        r'HADOLINT_VERSION:\s*"([^"]+)"',
    ),
    "nushell": (
        "nushell/nushell",
        ".github/workflows/polyglot-lint.yml",
        r'NU_VERSION:\s*"([^"]+)"',
    ),
}


def latest_release(repo):
    url = f"https://api.github.com/repos/{repo}/releases/latest"
    req = urllib.request.Request(
        url, headers={"Accept": "application/vnd.github+json"}
    )
    with urllib.request.urlopen(req, timeout=15) as resp:
        body = resp.read().decode()
    match = re.search(r'"tag_name":\s*"v?([^"]+)"', body)
    if not match:
        raise RuntimeError(f"couldn't find tag_name for {repo}")
    return match.group(1)


def pinned_version(path, pattern):
    with open(path) as f:
        content = f.read()
    match = re.search(pattern, content)
    if not match:
        raise RuntimeError(
            f"couldn't find version pin matching {pattern!r} in {path}"
        )
    return match.group(1)


def main():
    stale = []
    for tool, (repo, path, pattern) in PINS.items():
        try:
            pinned = pinned_version(path, pattern)
            latest = latest_release(repo)
        except (RuntimeError, urllib.error.URLError) as exc:
            print(f"WARN  {tool}: couldn't check ({exc})")
            continue
        if pinned != latest:
            print(f"STALE {tool}: pinned={pinned} latest={latest} ({path})")
            stale.append((tool, pinned, latest, path))
        else:
            print(f"OK    {tool}: {pinned}")

    if stale:
        print(f"\n{len(stale)} tool(s) have a newer release available.")
        sys.exit(1)
    print("\nAll pinned tool versions are current.")
    sys.exit(0)


if __name__ == "__main__":
    main()
