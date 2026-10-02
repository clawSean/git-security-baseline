#!/bin/sh
set -eu

target=${1:-.}
script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
baseline_root=$(CDPATH= cd -- "$script_dir/.." && pwd)

git -C "$target" rev-parse --show-toplevel >/dev/null
git -C "$target" config --local core.hooksPath "$baseline_root/hooks"

configured=$(git -C "$target" config --local --get core.hooksPath)
test "$configured" = "$baseline_root/hooks"
echo "GitLeaks pre-push hook enabled for $(git -C "$target" rev-parse --show-toplevel)"
