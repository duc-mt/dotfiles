import re
import sys
import yaml

with open("commit_convention.yaml") as f:
    config = yaml.safe_load(f)

scopes = list((config.get("scopes") or {}).keys())
raw_types = config.get("commit_types")
if not raw_types:
    types = [
        "build", "chore", "ci", "docs", "feat", "fix", "perf",
        "refactor", "revert", "style", "test",
    ]
else:
    types = [next(iter(t)) if isinstance(t, dict) else t for t in raw_types]

type_alt = "|".join(re.escape(t) for t in types)
scope_alt = "|".join(re.escape(s) for s in scopes)
pattern = re.compile(
    rf"^({type_alt})(\(({scope_alt})(,\s*({scope_alt}))*\))?!?: .+"
)
skip_pattern = re.compile(r"^(Merge |Revert )")

failed = False
checked = 0
for msg in sys.argv[1:]:
    first_line = msg.splitlines()[0] if msg else ""
    if not first_line or skip_pattern.match(first_line):
        print(f"SKIP  {first_line!r}")
        continue
    checked += 1
    if pattern.match(first_line):
        print(f"OK    {first_line!r}")
    else:
        print(f"FAIL  {first_line!r}")
        failed = True

if checked == 0:
    print("no commit messages required checking")
sys.exit(1 if failed else 0)
