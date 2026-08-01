# Hands-on experience (mapped to GPU / HPC / AI systems roles)

**Innocent Kisoka**  
Source of hands-on work: **CSCS–USI Summer School 2026** (Effective HPC & Data Analytics) + public CUDA portfolio below.

This page states **what I actually practiced**, and how it maps to common job requirements.  
It does **not** claim production experience running training on thousands of GPUs unless separately earned.

---

## One-line positioning

Hands-on **CUDA C++ / GPU-accelerated Python** and **parallel HPC** (MPI, OpenMP concepts, profiling mindset, multi-GPU communication model), demonstrated in complete public projects: memory models, custom kernels, shared-memory stencils, async multi-stream pipelines, a multi-module PDE mini-app, and **MPI + CUDA** domain decomposition.

---

## What I built (evidence)

| Repo | What it proves |
|------|----------------|
| [cuda-memory-and-kernels](https://github.com/InnocentKisoka/cuda-memory-and-kernels) | Host/device memory, `cudaMalloc`/`cudaMemcpy`, managed memory, **cuBLAS**, custom multi-block kernels, H2D/kernel/D2H timing & bandwidth thinking |
| [cuda-stencils-shared-memory](https://github.com/InnocentKisoka/cuda-stencils-shared-memory) | Shared memory, `__syncthreads`, races vs correct stencils, **2D CUDA launches**, diffusion PDE, halos |
| [cuda-async-pipelines](https://github.com/InnocentKisoka/cuda-async-pipelines) | **Streams, events, pinned memory**, overlapping transfers with compute, chunked pipelines |
| [cuda-pde-miniapp](https://github.com/InnocentKisoka/cuda-pde-miniapp) | Full multi-file GPU app: operators, linalg/CG structure, device params, end-to-end debugging of a numerical pipeline |
| [cuda-mpi-domain-decomposition](https://github.com/InnocentKisoka/cuda-mpi-domain-decomposition) | **MPI + CUDA**, domain decomposition, **halo exchange**, multi-process GPU mental model |
| [cuda-hpc-portfolio](https://github.com/InnocentKisoka/cuda-hpc-portfolio) | This index + experience mapping |

Also practiced (course notebooks / tutorial): **NumPy, CuPy, Numba CUDA, JAX, mpi4py**, OpenMP/PyOMP concepts, Thrust/CUB awareness, SLURM-style job scripts on CSCS systems.

---

## Job requirements → my hands-on match

### GPU architecture, CUDA, performance

| Requirement language | My hands-on |
|----------------------|-------------|
| Strong understanding of CPU/GPU architecture and how hardware affects performance | CPU vs GPU throughput model; warps; coalescing; HBM vs host DRAM; bandwidth-bound kernels (AXPY, stencils) |
| Hands-on CUDA C++ / CUDA Python / CuPy / Numba / JAX | CUDA C++ projects above; Python HPC: CuPy, Numba `@cuda.jit`, JAX `jit`/`scan` concepts |
| Thrust, CUB, modern GPU libraries | Used **cuBLAS**; course exposure to **Thrust/CUB** as library-first building blocks |
| Profiling and optimization (Nsight Systems / Compute) | Timing with **CUDA events**, separate H2D/kernel/D2H; course use of profilers / Nsight workflow concepts; portfolio stresses **bottleneck location** (transfer vs compute) |
| Identify and resolve bottlenecks in parallel apps | Explicit experiments: transfer-dominated vs compute; shared-memory vs global; async overlap to hide latency |

### Parallel communication (MPI, NCCL-class thinking)

| Requirement language | My hands-on |
|----------------------|-------------|
| MPI and low-level communication libraries | **MPI + CUDA** diffusion: ranks, domain split, **halo exchange**; mpi4py Send/Recv vs send/recv; collectives (bcast/scatter/gather/reduce) |
| NCCL (multi-GPU collectives) | Not a production NCCL owner yet. **Solid foundation**: multi-process GPU data movement, halo traffic, GPU-aware MPI idea—the same issues NCCL solves at scale for all-reduce |
| Debugging large parallel applications | Multi-file GPU miniapp + MPI decomposition: correctness at boundaries, races, sync bugs, launch configs |

### Cluster / production environment (honest framing)

| Requirement language | My hands-on |
|----------------------|-------------|
| Thousands of GPUs in production training | **Not claimed.** I have **cluster-oriented training** on CSCS-class systems (course accounts, job scripts, multi-process GPU codes)—ready to extend to production training stacks |
| SLURM / cloud scheduling | Used **HPC course environment** (login, jobs, `job.sbatch`-style launches); understand batch scheduling model |
| Stack debugging (app → runtime → scheduler → hardware) | Practiced full stack **within course scope**: app kernels, CUDA runtime, MPI, host/device memory, launch/sync; mental model for frameworks on top |
| NVIDIA platforms at cluster scale | Hands-on **NVIDIA CUDA** on multi-GPU-capable HPC platforms (CSCS Summer School); projects structured for NVIDIA GPU architectures (`sm_*` builds) |

### AI / LLM frameworks (what I can say today)

| Requirement language | My hands-on |
|----------------------|-------------|
| PyTorch / Megatron / NeMo / vLLM internals | **Not production framework ownership.** I have the **GPU compute layer** those tools sit on: CUDA kernels, memory, streams, MPI-style multi-GPU communication |
| Training/inference pipeline efficiency | Can reason about **where time goes** (data movement, kernel launch, sync, communication) and implement GPU-side fixes—the skill used when assisting framework/product teams |

### Software engineering (C++ / Python / libraries)

| Requirement language | My hands-on |
|----------------------|-------------|
| Strong C++ and/or Python | **C++/CUDA** multi-module apps; **Python** GPU stack (NumPy/CuPy/Numba/JAX/mpi4py) |
| Systems-level software (performance, memory, concurrency, APIs) | Memory spaces, streams, sync, shared memory, atomics, host APIs for device code |
| Parallel / heterogeneous programming | CUDA, OpenMP concepts, GPU-accelerated Python, MPI+CUDA |
| Testing, profiling, docs, code review style | Public repos: build systems, validation checks, README design notes, clean completed kernels (no leftover TODOs) |
| Own features end-to-end | Portfolio repos: implement → document → build → push → maintain narrative for users/recruiters |

---

## Roles I can support (with this evidence)

**Strong fit / ready to contribute immediately**
- GPU / CUDA software engineer (junior–mid)
- HPC application / performance engineer (GPU-focused)
- Developer productivity on GPU libraries (algorithms, bindings, examples, docs)
- Customer-facing GPU performance investigation **with senior NVIDIA/framework engineers**

**Ready to ramp with mentoring**
- Multi-thousand-GPU training stability (need production exposure)
- Deep Megatron/NeMo/vLLM internals (need product-code ownership)
- NCCL tuning at scale (need multi-node production runs)

---

## How I describe collaboration-style work (accurate)

I can:

- **Collaborate** with framework and platform engineers using a shared vocabulary (CUDA, streams, MPI/collectives, bottlenecks).
- **Assist** deployment and efficiency of GPU workloads by isolating transfer vs compute vs communication.
- **Benchmark** kernels and mini-apps, report H2D/kernel/D2H and scaling behavior, share actionable findings.
- **Help partners/customers** understand GPU architecture effects and adopt CUDA / multi-GPU patterns correctly.
- **Document** designs clearly (see repo READMEs and [book notes](../SummerSchool/HPC_CUDA_BookNotes/) if mirrored).

I do **not** claim I already ran and debugged full LLM training on thousands of GPUs in production. I claim **solid accelerated-computing foundations** and **public proof of work** to grow into that scope quickly.

---

## CV bullets (copy-paste)

- Implemented multi-block **CUDA C++** kernels and **cuBLAS** workflows; measured H2D/kernel/D2H and diagnosed bandwidth-bound behavior.  
- Built shared-memory stencils and a **2D GPU diffusion** solver with correct synchronization and halo handling.  
- Designed **async multi-stream pipelines** (events, pinned memory) to overlap PCIe transfers with device compute.  
- Delivered a multi-module **GPU PDE mini-app** (operators + linalg/CG structure + device data management).  
- Implemented **MPI + CUDA** domain decomposition with halo exchange for multi-process GPU execution.  
- Practiced **GPU-accelerated Python** (CuPy, Numba CUDA, JAX concepts) and mpi4py communication patterns.  
- Worked in an **HPC cluster course environment** (CSCS) with batch-style job execution and NVIDIA CUDA toolchains.

---

## Interview order (5 minutes)

1. Memory + AXPY → architecture & bandwidth  
2. Shared stencil → correctness & sync  
3. Async pipeline → systems performance  
4. Miniapp → real code structure  
5. MPI+CUDA → multi-GPU/node communication model  

---

*Last updated: 2026-08-01*
