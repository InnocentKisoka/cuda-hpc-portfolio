#!/usr/bin/env bash
set -euo pipefail
# Usage: GH_TOKEN=ghp_xxx ./push_with_token.sh
# Or:    ./push_with_token.sh   # uses gh auth token

cd "$(dirname "$0")"
if [ -z "${GH_TOKEN:-}" ]; then
  if gh auth token >/dev/null 2>&1; then
    GH_TOKEN=$(gh auth token)
  else
    echo "Run: gh auth login"
    echo "Then: ./push_with_token.sh"
    exit 1
  fi
fi
USER=$(curl -sS -H "Authorization: token $GH_TOKEN" https://api.github.com/user | python3 -c "import sys,json; print(json.load(sys.stdin)['login'])")
echo "User: $USER"

push_repo() {
  local d=$1
  echo ">>> $d"
  cd "$d"
  git remote remove origin 2>/dev/null || true
  git remote add origin "https://x-access-token:${GH_TOKEN}@github.com/${USER}/${d}.git"
  git push -u origin main --force
  git remote set-url origin "https://github.com/${USER}/${d}.git"
  cd ..
  echo "    https://github.com/${USER}/${d}"
}

for d in cuda-memory-and-kernels cuda-stencils-shared-memory cuda-async-pipelines cuda-pde-miniapp cuda-mpi-domain-decomposition; do
  push_repo "$d"
done

# Hub index only
tmpdir=$(mktemp -d)
cp README.md APPLICATIONS.md PUBLISH.md PUSH_ALL.sh "$tmpdir/" 2>/dev/null || true
(
  cd "$tmpdir"
  git init -b main
  git add .
  git -c user.email="76830393+InnocentKisoka@users.noreply.github.com" -c user.name="Innocent Kisoka" commit -m "Portfolio hub"
  git remote add origin "https://x-access-token:${GH_TOKEN}@github.com/${USER}/cuda-hpc-portfolio.git"
  git push -u origin main --force
)
rm -rf "$tmpdir"
echo "ALL DONE"
