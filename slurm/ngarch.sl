#!/bin/bash
#SBATCH --job-name=ngarch
#SBATCH --cpus-per-task=1
#SBATCH --account=niwap99999
#SBATCH --partition=niwa_work
#SBATCH --cluster=maui_ancil
#SBATCH --gpus-per-node=nvidia_a100_1g.10gb:1
#SBATCH --time=00:30:00
echo "Date              = $(date)"
echo "Hostname          = $(hostname -s)"
echo "Working Directory = $(pwd)"
echo ""
echo "Number of Nodes Allocated      = $SLURM_JOB_NUM_NODES"
echo "Number of Tasks Allocated      = $SLURM_NTASKS"
echo "Number of Cores/Task Allocated = $SLURM_CPUS_PER_TASK"

exe=../bin/ngarch
conf=configuration.nml
sif=/nesi/nobackup/nesi99999/pletzera/ngarch/ngarch_apptainer/ngarch_nvhpc.sif
module load Singularity CUDA
singularity exec --nv \
  -B/opt/niwa/um_sys/,/nesi/nobackup/nesi99999/pletzera/,/opt/nesi,/nesi/project/uoo03538/um/ \
  $sif $exe $conf
