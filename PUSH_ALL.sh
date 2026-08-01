#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
echo "Logging into GitHub..."
gh auth login -p https -h github.com -w
USER=$(gh api user -q .login)
echo "Logged in as $USER"

for d in cuda-memory-and-kernels cuda-stencils-shared-memory cuda-async-pipelines cuda-pde-miniapp cuda-mpi-domain-decomposition; do
  echo ">>> $d"
  cd "$d"
  git remote remove origin 2>/dev/null || true
  git remote add origin "https://github.com/$USER/$d.git"
  git push -u origin main --force
  cd ..
  echo "    https://github.com/$USER/$d"
done

# Hub: only docs (avoid nesting project folders)
echo ">>> cuda-hpc-portfolio"
tmpdir=$(mktemp -d)
cp README.md APPLICATIONS.md PUBLISH.md PUSH_ALL.sh "$tmpdir/" 2>/dev/null || true
cd "$tmpdir"
git init -b main
git add .
git -c user.email="76830393+InnocentKisoka@users.noreply.github.com" -c user.name="Innocent Kisoka" commit -m "Portfolio hub index"
git remote add origin "https://github.com/$USER/cuda-hpc-portfolio.git"
git push -u origin main --force
cd -
rm -rf "$tmpdir"
echo "ALL DONE"
