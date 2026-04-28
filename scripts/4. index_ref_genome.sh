#!/bin/bash
#SBATCH --partition=defq
#SBATCH --job-name=index_ref_genome
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=16g
#SBATCH --time=2:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=[YOUR-EMAIL]

#sourcing bash profile to enable conda
source $HOME/.bash_profile

#activating conda environment
conda activate rotation3

#indexing genome (needs to be done only once)
bwa index ../reference_genome/[REFERENCE_FILE_NAME]

#deactivating the conda environment
conda deactivate
