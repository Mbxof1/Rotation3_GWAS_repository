#!/bin/bash
#SBATCH --partition=defq
#SBATCH --job-name=dog_pca
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=100g
#SBATCH --time=02:00:00
#SBATCH --output=/share/BioinfMSc/life4136_2526/rotation3/group5/scripts/logs/slurm/slurm-%x-%j.out
#SBATCH --error=/share/BioinfMSc/life4136_2526/rotation3/group5/scripts/logs/slurm/slurm-%x-%j.err
#SBATCH --mail-user=lpxis2@nottingham.ac.uk
#SBATCH --mail-type=begin
#SBATCH --mail-type=end
#SBATCH --mail-type=fail

# load environment
source $HOME/.bash_profile

# load plink
module load plink-uoneasy/2.00a3.7-foss-2023a

# set directory
SET_DIR=/share/BioinfMSc/life4136_2526/rotation3/group5

# directories
PLINK_DIR=$SET_DIR/plink
PCA_DIR=$PLINK_DIR/pca

# input dataset QC filtered
INPUT_DATA=$PLINK_DIR/qc/dog_qc

# pruned SNP list from previous step
PRUNE_IN=$PCA_DIR/prune.prune.in

# output data
OUTPUT_DATA=$PCA_DIR/pca20

# run PCA on pruned SNPs
plink --bfile "$INPUT_DATA" --allow-extra-chr --extract "$PRUNE_IN" --pca 20 --out "$OUTPUT_DATA"
