# Push full source code to GitHub (one command)

Repositories already exist under **InnocentKisoka** with professional READMEs.
Full CUDA source is prepared locally. Publish it with:

```bash
cd ~/cuda-portfolio
./PUSH_ALL.sh
```

That script will:
1. Run `gh auth login` if needed (browser)
2. Push all 5 project repos + update the hub

## After push: pin on your profile

1. https://github.com/InnocentKisoka/cuda-pde-miniapp  
2. https://github.com/InnocentKisoka/cuda-async-pipelines  
3. https://github.com/InnocentKisoka/cuda-memory-and-kernels  
4. https://github.com/InnocentKisoka/cuda-stencils-shared-memory  
5. https://github.com/InnocentKisoka/cuda-mpi-domain-decomposition  

Hub: https://github.com/InnocentKisoka/cuda-hpc-portfolio  

## Manual alternative

```bash
gh auth login
cd ~/cuda-portfolio/cuda-memory-and-kernels
git remote add origin https://github.com/InnocentKisoka/cuda-memory-and-kernels.git 2>/dev/null || true
git push -u origin main --force
# repeat for other folders
```
