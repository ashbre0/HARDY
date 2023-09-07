# Zeta Calculation using PARI

This repository contains scripts and source files for running a calculation of the Zeta function using the PARI library.

## Prerequisites

1. A Linux environment with standard build tools (like `wget`, `make`, and `tar`) installed.
2. A Fortran compiler. These scripts assume you have one available as `ftn`.
3. SLURM workload manager for batch job submission.

### 0. Setup and Running

To get started, clone the repository to your local machine and enter the directory:

git clone https://github.com/ashbre0/HARDY.git
cd HARDY

To make changes to the source code, update the relevant files and then execute:

git add .
git commit -m "Your descriptive message about the changes"
git push

### 1. Install PARI Library

Run the `install_pari.sh` script. This script will:
- Download the PARI source code.
- Configure, compile, and install PARI in the current directory.
- Add necessary environment variables to your `.bashrc`.

bash install_pari.sh

### 2. Compile the Fortran Code

Once PARI is installed, you can compile the Fortran program using:

bash compile.sh


### 3. Submit the Job to SLURM

Before submitting, you need to ensure that the SLURM account in zeta.pbs matches your available SLURM account. To check your available account, run:

sacctmgr show assoc where user=$LOGNAME format=user,Account%12,MaxTRESMins,QOS%40

Then, modify the #SBATCH --account=ta070-ashbre1 line in zeta.pbs with your appropriate account details.

To submit the job, use:

sbatch zeta.pbs



File Descriptions:
zeta.f90: Fortran source file for the calculation.
install_pari.sh: Script to download, compile, and install PARI.
compile.sh: Script to compile the Fortran program with PARI library linkage.
zeta.pbs: SLURM batch job script for running the compiled Fortran program.

Note: The SLURM script will also check for the existence of a file named zeta14v3resa before executing the program. If the file does not exist, it will be created.

Acknowledgments
PARI/GP - For providing the library used in this calculation
