#!/bin/bash
#SBATCH --partition=defq
#SBATCH --job-name=dog_plink_qc
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
module load plink-uoneasy/1.9b_6.21-x86_64

# set dir
SET_DIR=/share/BioinfMSc/life4136_2526/rotation3/group5

# input/output directories
PLINK_DIR=$SET_DIR/plink
OUT_DIR=$PLINK_DIR/qc

# create output directory
mkdir -p "$OUT_DIR"

# input binary plink dataset 
INPUT_BINARY=$PLINK_DIR/dog_raw

# output 
OUTPUT_QC=$OUT_DIR/dog_qc

# run QC filtering
plink --bfile "$INPUT_BINARY" --allow-extra-chr --geno 0.3 --mind 0.6 --maf 0.05 --make-bed --out "$OUTPUT_QC"

# count individuals and variants after filtering
wc -l "${OUTPUT_QC}.fam" > "${OUTPUT_QC}.individual_count.txt"
wc -l "${OUTPUT_QC}.bim" > "${OUTPUT_QC}.variant_count.txt"
