#!/bin/bash
#SBATCH --partition=defq
#SBATCH --job-name=vcf_cleanup
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

# load bcftools
module load bcftools-uoneasy/1.18-GCC-13.2.0

# base dir
BASE_DIR=/share/BioinfMSc/life4136_2526/rotation3/group5

# defiing input/output paths
INPUT_VCF=$BASE_DIR/vcf/dog.vcf.gz
OUT_DIR=$BASE_DIR/vcf/filtered
OUTPUT_VCF=$OUT_DIR/dog_snps.vcf.gz

# creating output directory
mkdir -p $OUT_DIR

# filter: keep only biallelic SNPs
bcftools view -m2 -M2 -v snps "$INPUT_VCF" -Oz -o "$OUTPUT_VCF"






