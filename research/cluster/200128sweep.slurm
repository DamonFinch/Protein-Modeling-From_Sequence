#!/bin/bash
#SBATCH --job-name=protein-sweep
#SBATCH --nodes=1
#SBATCH --gpus=1
#SBATCH -C "C6"
#SBATCH --cpus-per-gpu=4
#SBATCH --time=7-00:00:00
#SBATCH --partition=dept_gpu
#SBATCH --output="../research/cluster/slurm/200131sweep/slurm-%A_%a.out"


############################
##       Environment      ##
############################
eval "$(conda shell.bash hook)"
conda activate psp
module load cuda/10.1


############################
##     Array Job Exec.    ##
############################
cd $SLURM_SUBMIT_DIR
wandb agent --count 1 koes-group/protein-transformer/ohkwkqpq

exit 0
