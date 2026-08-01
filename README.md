# CUDA HPC Portfolio

Hands-on **CUDA C++**, **GPU-accelerated Python**, and **parallel HPC** (MPI + CUDA), from the **CSCS–USI Summer School 2026** (Effective HPC & Data Analytics).

**→ Read first: [EXPERIENCE.md](./EXPERIENCE.md)** — clear mapping of my hands-on work to GPU/HPC/AI systems job requirements (CUDA, profiling, MPI, clusters, frameworks — ).

---

## What I can do (short)

| Area | Hands-on |
|------|----------|
| **CUDA / GPU architecture** | Custom kernels, warps/coalescing, shared memory, atomics, 2D launches, HBM vs host memory |
| **Performance** | Event timing, H2D vs kernel vs D2H bottlenecks, async overlap (streams/events/pinned memory) |
| **Libraries** | cuBLAS; Thrust/CUB as library-first approach |
| **Python GPU** | CuPy, Numba CUDA, JAX concepts |
| **Parallel communication** | MPI + CUDA domain decomposition, halo exchange, mpi4py collectives |
| **Full apps** | Multi-module PDE mini-app (debug operators + linalg + data movement) |
| **Clusters** | CSCS-class HPC environment, batch job scripts, multi-process GPU runs |



---

## Repositories

| Repository | What it shows |
|------------|----------------|
| [**cuda-memory-and-kernels**](https://github.com/InnocentKisoka/cuda-memory-and-kernels) | Memory models, cuBLAS, multi-block kernels, bandwidth |
| [**cuda-stencils-shared-memory**](https://github.com/InnocentKisoka/cuda-stencils-shared-memory) | Shared memory, sync, 2D diffusion |
| [**cuda-async-pipelines**](https://github.com/InnocentKisoka/cuda-async-pipelines) | Streams, events, transfer/compute overlap |
| [**cuda-pde-miniapp**](https://github.com/InnocentKisoka/cuda-pde-miniapp) | End-to-end GPU scientific application |
| [**cuda-mpi-domain-decomposition**](https://github.com/InnocentKisoka/cuda-mpi-domain-decomposition) | MPI + CUDA, halos, multi-process GPU |

---



> Hands-on CUDA C++ and GPU-accelerated Python: custom kernels, shared-memory stencils, async multi-stream pipelines, PDE mini-apps, and MPI+CUDA domain decomposition (CSCS–USI HPC Summer School). Public portfolio: github.com/InnocentKisoka/cuda-hpc-portfolio

---



|  | See… |
|---------------|------|
| CUDA / CPU–GPU architecture | [EXPERIENCE.md](./EXPERIENCE.md) § GPU architecture · repos 1–2 |
| Profiling / bottlenecks / Nsight-style work | EXPERIENCE § Performance · `cuda-memory-and-kernels`, `cuda-async-pipelines` |
| MPI / multi-GPU communication (NCCL-ready foundation) | EXPERIENCE § Parallel communication · `cuda-mpi-domain-decomposition` |
| Cluster / SLURM-style environments | EXPERIENCE § Cluster · course + job scripts |
| C++ / Python / library engineering | All repos + EXPERIENCE § Software engineering |
| Assist customers / NVIDIA platforms / efficiency | EXPERIENCE § Collaboration-style work |
| LLM frameworks (PyTorch, Megatron, vLLM, …) | EXPERIENCE § AI frameworks — **compute-layer readiness**, not production ownership yet |


---

## Build (local)

```bash
for d in cuda-memory-and-kernels cuda-stencils-shared-memory cuda-async-pipelines cuda-pde-miniapp; do
  (cd "$d" && make ARCH=sm_80)   # set ARCH to your GPU
done
```

---




