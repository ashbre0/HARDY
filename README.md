# Zeta Calculation using PARI

This repository contains scripts and source files for running a calculation of the Zeta function using the [PARI library](https://pari.math.u-bordeaux.fr/).

## Prerequisites

1. A Linux environment with standard build tools (like `wget`, `make`, and `tar`) installed.
2. A Fortran compiler. These scripts assume you have one available as `ftn`.
3. SLURM workload manager for batch job submission.

### 0. Setup and Running

To get started, clone the repository to your local machine and enter the directory:

```bash
git clone https://github.com/ashbre0/HARDY.git
cd HARDY
```

To make changes to the source code, update the relevant files and then execute:

```bash
git add .
git commit -m "Your descriptive message about the changes"
git push
```
**Note**

* `git add .` will add all modified files to the commit in the git directory and subdirectories so be careful using this command for unwanted consequences. It is better to explicitly add the files that you want to be added to the commit: `git add file1 file2 dir/file3 ...`, etc. 
* You can find what files have changed in your repository by using `git status` and explicitly add only those files that you want in the repository.

### 1. Install PARI Library

Run the `install_pari.sh` script. This script will:
- Download the PARI source code.
- Configure, compile, and install PARI in the current directory.
- Add necessary environment variables to your `.bashrc`.

```bash
bash install_pari.sh
```

### 2. Compile the Fortran Code

Once PARI is installed, you can compile the Fortran program using:

```bash
bash compile.sh
```


### 3. Run a quick test

Make sure it works (use ctrl+c to exit after the first iblock shows up):

```bash
bash run_test.sh
```


### 4. Submit the Job to SLURM

Before submitting, you need to ensure that the SLURM account in `zeta.pbs` matches your available SLURM account. To check your available account, run:

```bash
sacctmgr show assoc where user=$LOGNAME format=user,Account%12,MaxTRESMins,QOS%40
```

Then, modify the `#SBATCH --account=ta070-ashbre1` line in `zeta.pbs` with your appropriate account details.

To submit the job, use:

```bash
sbatch zeta.pbs
```

File Descriptions:

* `zeta.f90`: Fortran source file for the calculation.
* `install_pari.sh`: Script to download, compile, and install PARI.
* `compile.sh`: Script to compile the Fortran program with PARI library linkage.
* `zeta.pbs`: SLURM batch job script for running the compiled Fortran program.

**Note**: The SLURM script will also check for the existence of a file named `zeta14v3resa` before executing the program. If the file does not exist, it will be created.

**Acknowledgments**

* Part of this work was performed with funding from the embedded CSE programme of the [ARCHER2 UK National Supercomputing Service](https://www.archer2.ac.uk/).
* [PARI/GP](https://pari.math.u-bordeaux.fr) - For providing the library used in this calculation.
