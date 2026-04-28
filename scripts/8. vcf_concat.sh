#!/bin/bash
#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=20
#SBATCH --job-name=vcf-concat
#SBATCH --mem=200g
#SBATCH --time=2:00:00
#SBATCH --mail-user=[YOUR-EMAIL]
#SBATCH --mail-type=ALL

#load in bcftools
module load bcftools-uoneasy/1.19-GCC-13.2.0

#change to vcf directory and create a file containing the vcf names in the scripts directory
cd ../vcf
ls *.vcf > ../scripts/vcf_names.txt

# Concatenate all vcf files into a single vcf file
bcftools concat --file-list ../scripts/vcf_names.txt -Oz --output compiled.vcf.gz
bcftools index compiled.vcf.gz
