#!/bin/bash
#SBATCH --partition=defq
#SBATCH --job-name=dog_missingness
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

#creatinf output directory
mkdir -p "$OUT_DIR"

# input plink binary dataset 
INPUT_BINARY=$PLINK_DIR/dog_raw

#output for missingness results
OUTPUT_MISSING=$OUT_DIR/dog_missing

# run missingness check
plink --bfile "$INPUT_BINARY" --missing --allow-extra-chr --out "$OUTPUT_MISSING"

