#!/bin/bash
#SBATCH --partition=defq
#SBATCH --job-name=dog_ld_prune
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=100g
#SBATCH --time=02:00:00
#SBATCH --mail-user=[YOUR-EMAIL]
#SBATCH --mail-type=ALL

# load plimk
module load plink-uoneasy/2.00a3.7-foss-2023a

# input and output directories
PLINK_DIR=../plink
OUT_DIR=$PLINK_DIR/pca

# create PCA directory
mkdir -p "$OUT_DIR"

# input QC dataset
INPUT_DATA=$PLINK_DIR/qc/qc

# output
OUTPUT_DATA=$OUT_DIR/prune

# LD pruning
plink --bfile "$INPUT_DATA" --allow-extra-chr --indep-pairwise 50 5 0.2 --out "$OUTPUT_DATA"
