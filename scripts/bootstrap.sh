#!/bin/sh
set -eu

baseline_sha=95d9ef8505d7d38a6b7a9c599b00781600221aa7
baseline_url=https://raw.githubusercontent.com/clawSean/git-security-baseline/$baseline_sha
target=${1:-.}

command -v git >/dev/null 2>&1 || {
  echo "git is required but was not found in PATH" >&2
  exit 1
}
command -v curl >/dev/null 2>&1 || {
  echo "curl is required but was not found in PATH" >&2
  exit 1
}
command -v gitleaks >/dev/null 2>&1 || {
  echo "gitleaks is required but was not found in PATH" >&2
  exit 1
}

repo_root=$(git -C "$target" rev-parse --show-toplevel)
cache_root=${XDG_DATA_HOME:-$HOME/.local/share}/clawSean/git-security-baseline/$baseline_sha
hook_path=$cache_root/hooks/pre-push
workflow_path=$repo_root/.github/workflows/gitleaks.yml

mkdir -p "$(dirname "$hook_path")"
curl -fsSL "$baseline_url/hooks/pre-push" -o "$hook_path.tmp"
chmod 0755 "$hook_path.tmp"
mv "$hook_path.tmp" "$hook_path"

mkdir -p "$(dirname "$workflow_path")"
workflow_tmp=$workflow_path.tmp
cat >"$workflow_tmp" <<EOF
name: GitLeaks

on:
  push:
  pull_request:

permissions:
  contents: read
  pull-requests: read

jobs:
  gitleaks:
    uses: clawSean/git-security-baseline/.github/workflows/gitleaks.yml@$baseline_sha
EOF

if [ -e "$workflow_path" ] && ! cmp -s "$workflow_tmp" "$workflow_path"; then
  rm -f "$workflow_tmp"
  echo "Refusing to replace existing $workflow_path" >&2
  exit 1
fi
mv "$workflow_tmp" "$workflow_path"

git -C "$repo_root" config --local core.hooksPath "$cache_root/hooks"

configured=$(git -C "$repo_root" config --local --get core.hooksPath)
test "$configured" = "$cache_root/hooks"
echo "GitLeaks hook and CI enabled for $repo_root"
echo "Review and commit .github/workflows/gitleaks.yml"
