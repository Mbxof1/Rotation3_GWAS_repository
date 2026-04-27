#!/bin/bash
#SBATCH --partition=defq
#SBATCH --job-name=index_ref_genome
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=16g
#SBATCH --time=2:00:00
#SBATCH --output=/share/BioinfMSc/life4136_2526/rotation3/group1/CJ/results/logs/slurm/slurm-%x-%j.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxas28@nottingham.ac.uk

#script to index the dog reference assembly genome

#sourcing bash profile to enable conda
source $HOME/.bash_profile

#activating conda environment
conda activate rotation3

#indexing genome (needs to be done only once)
bwa index ../reference_genome/GCF_011100685.1_UU_Cfam_GSD_1.0_genomic.fna

#deactivating the conda environment
conda deactivate
