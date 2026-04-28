#!/bin/bash
#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=28
#SBATCH --mem=50g
#SBATCH --time=10:00:00
#SBATCH --job-name=fastqc
#SBATCH --mail-type=ALL
#SBATCH --mail-user=[YOUR-EMAIL]

#source bash profile to enable conda
source $HOME/.bash_profile

#activate conda environment
conda activate rotation3

#Defining the input files for fastqc
INPUT_FILES=../fastp/*trimmed.fq.gz

#Defining output directory
OUTDIR=../fastp/fastqc

#Making the output directory
mkdir -p "$OUTDIR"

#running fastqc
fastqc \
$INPUT_FILES \
-o "$OUTDIR" \
-t 28

#deactivating conda environment
conda deactivate
