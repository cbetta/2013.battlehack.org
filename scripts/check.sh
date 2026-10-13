#!/usr/bin/env bash
# What "green" means for the archive: it has no packages to install, so it is
# every local link and asset resolving the way nginx serves them
# (scripts/known-broken-links.txt lists what was already broken on Netlify).
# CI (.github/workflows/ci.yml) and deps-factory both run this.
set -euo pipefail
cd "$(dirname "$0")/.."

python3 scripts/check-links.py . --known scripts/known-broken-links.txt --dir-index \
  2013.battlehack.betta.io 2013.battlehack.org
