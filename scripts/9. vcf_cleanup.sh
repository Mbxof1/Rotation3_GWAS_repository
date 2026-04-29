#!/bin/bash
#SBATCH --partition=defq
#SBATCH --job-name=vcf_cleanup
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=100g
#SBATCH --time=02:00:00
#SBATCH --mail-user=[YOUR-EMAIL]
#SBATCH --mail-type=ALL

# load bcftools
module load bcftools-uoneasy/1.18-GCC-13.2.0

# defining input/output paths
INPUT_VCF=../vcf/compiled.vcf.gz
OUT_DIR=../vcf/filtered
OUTPUT_VCF=$OUT_DIR/snps.vcf.gz

# creating output directory
mkdir -p $OUT_DIR

# filter: keep only biallelic SNPs
bcftools view -m2 -M2 -v snps "$INPUT_VCF" -Oz -o "$OUTPUT_VCF"
