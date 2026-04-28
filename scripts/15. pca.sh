#!/bin/bash
#SBATCH --partition=defq
#SBATCH --job-name=dog_pca
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=100g
#SBATCH --time=02:00:00
#SBATCH --mail-user=[YOUR-EMAIL]
#SBATCH --mail-type=ALL

# load plink
module load plink-uoneasy/2.00a3.7-foss-2023a

# set directory
SET_DIR=/share/BioinfMSc/life4136_2526/rotation3/group5

# directories
PLINK_DIR=$SET_DIR/plink
PCA_DIR=$PLINK_DIR/pca

# input dataset QC filtered
INPUT_DATA=$PLINK_DIR/qc/qc

# pruned SNP list from previous step
PRUNE_IN=$PCA_DIR/prune.prune.in

# output data
OUTPUT_DATA=$PCA_DIR/pca20

# run PCA on pruned SNPs
plink --bfile "$INPUT_DATA" --allow-extra-chr --extract "$PRUNE_IN" --pca 20 --out "$OUTPUT_DATA"
