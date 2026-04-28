#!/bin/bash
#SBATCH --partition=defq
#SBATCH --job-name=bam_filter
#SBATCH --nodes=1
#SBATCH --ntasks=8
#SBATCH --mem=20g
#SBATCH --time=04:00:00
#SBATCH --array=0-114
#SBATCH --mail-type=ALL
#SBATCH --mail-user=[YOUR-EMAIL]

#sourcing home bash profile
source $HOME/.bash_profile

#activating environment
conda activate rotation3

# loading software
module load samtools-uoneasy/1.18-GCC-12.3.0

# making output directory
mkdir -p ../logs/slurm

# mapping sample names from names.txt
mapfile -t SAMPLES < names.txt
SAMPLE=${SAMPLES[$SLURM_ARRAY_TASK_ID]}

# filter the BAM file
# -q 10 (for now, said to be used where some ambiguity is acceptable)
# -F 2308: removes unmapped secondary, and supplementary reads
samtools view -@ 8 -b -q 10 -F 2308 ../bam/${SAMPLE}.rmd.bam > ../bam/${SAMPLE}.90%con.filtered.bam
# index the new filtered BAM file
samtools index ../bam/${SAMPLE}.90%con.filtered.bam
