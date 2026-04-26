#!/bin/bash
#SBATCH --partition=defq
#SBATCH --job-name=BAM_to_VCF
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=30g
#SBATCH --time=72:00:00
#SBATCH --array=0-38
#SBATCH --output=logs/slurm/slurm-%x-%A.out
#SBATCH --error=logs/slurm/slurm-%x-%A.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxof1@nottingham.ac.uk

#Load in modules
module load bcftools-uoneasy/1.19-GCC-13.2.0
module load samtools-uoneasy/1.22.1-GCC-14.2.0

#load chromosomes into an array
mapfile -t ROOTS < ../chr.names.txt
SAMPLE=${ROOTS[$SLURM_ARRAY_TASK_ID]}

#text file listing bam files
BAMLIST=../bam_names.txt

#change directory
cd ../bam

#VCF output
OUT=../vcf/${SAMPLE}.vcf

# Run mpileup and call variants for the current sample
bcftools mpileup --threads 39 -Ou -f ../dog_reference/GCF_011100685.1_UU_Cfam_GSD_1.0_genomic.fna --platforms ILLUMINA --annotate FORMAT/DP,FORMAT/AD --bam-list "$BAMLIST" -r "${SAMPLE}" | bcftools call --threads 39 -mv -a GQ,GP -Oz -o "$OUT"

# Convert BCF to VCF format and index the VCF file
bcftools index $OUT

