#!/bin/bash
#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --job-name=converting-files
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

#loading the plink module
module load plink-uoneasy/2.00a3.7-foss-2023a

#converting files from vcf
plink --vcf ../vcf/filtered/dog.vcf.gz --double-id --allow-extra-chr --make-bed --out ../plink/dog_raw
