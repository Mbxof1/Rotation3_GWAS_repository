#!/bin/bash
#SBATCH --partition=defq
#SBATCH --job-name=dog_missingness
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=100g
#SBATCH --time=02:00:00
#SBATCH --mail-user=[YOUR-EMAIL]
#SBATCH --mail-type=ALL

# load plink
module load plink-uoneasy/1.9b_6.21-x86_64

# input/output directories
PLINK_DIR=../plink
OUT_DIR=$PLINK_DIR/qc

#creatinf output directory
mkdir -p "$OUT_DIR"

# input plink binary dataset 
INPUT_BINARY=$PLINK_DIR/raw

#output for missingness results
OUTPUT_MISSING=$OUT_DIR/missingness

# run missingness check
plink --bfile "$INPUT_BINARY" --missing --allow-extra-chr --out "$OUTPUT_MISSING"
