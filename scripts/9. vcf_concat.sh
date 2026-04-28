#!/bin/bash
#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=20
#SBATCH --job-name=vcf-concat
#SBATCH --mem=200g
#SBATCH --time=2:00:00
#SBATCH --mail-user=mbxas28@nottingham.ac.uk
#SBATCH --output=/share/BioinfMSc/life4136_2526/rotation3/group5/scripts/logs/slurm/slurm-%x-%j.out
#SBATCH --error=/share/BioinfMSc/life4136_2526/rotation3/group5/scripts/logs/slurm/slurm-%x-%j.err
#SBATCH --mail-type=begin
#SBATCH --mail-type=end
#SBATCH --mail-type=fail

#sourcing home bash profile
source $HOME/.bash_profile

#activating environment
conda activate rotation3

#load in bcftools
module load bcftools-uoneasy/1.19-GCC-13.2.0

#change to vcf directory
cd ../vcf

# Concatenate all vcf files into a single vcf file
bcftools concat --file-list ../vcf.names.txt -Oz --output /share/BioinfMSc/life4136_2526/rotation3/group5/vcf/dog.vcf.gz
bcftools index /share/BioinfMSc/life4136_2526/rotation3/group5/vcf/dog.vcf.gz
