#!/bin/bash
#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=75g
#SBATCH --time=6:00:00
#SBATCH --job-name=fastp
#SBATCH --output=/share/BioinfMSc/life4136_2526/rotation3/group5/scripts/logs/slurm/fastp/slurm-%x-%j.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxas28@nottingham.ac.uk
#SBATCH --array=0-114


source $HOME/.bash_profile

#activate conda environment
conda activate rotation3

#loading the sample sinto an array
mapfile -t ROOTS < names.txt

#does the job for each sample based on the sample name
SAMPLE=${ROOTS[$SLURM_ARRAY_TASK_ID]}

#input files
FILE1=../raw_data_folder/${SAMPLE}_1.fastq.gz
FILE2=../raw_data_folder/${SAMPLE}_2.fastq.gz

#output directory
OUTDIR=../fastp
mkdir -p "$OUTDIR"

#running fastp
fastp \
  --in1 "$FILE1" \
  --in2 "$FILE2" \
  --out1 "$OUTDIR/${SAMPLE}_R1.trimmed.fq.gz" \
  --out2 "$OUTDIR/${SAMPLE}_R2.trimmed.fq.gz" \
  -l 50 \
  -h "$OUTDIR/${SAMPLE}.html" \
  &> "$OUTDIR/${SAMPLE}.log"

conda deactivate
