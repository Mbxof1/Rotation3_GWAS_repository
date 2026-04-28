#!/bin/bash
#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --job-name=converting-files
#SBATCH --mem=200g
#SBATCH --time=2:00:00
#SBATCH --mail-user=[YOUR-EMAIL]
#SBATCH --mail-type=ALL

#sourcing home bash profile
source $HOME/.bash_profile

#loading the plink module
module load plink-uoneasy/2.00a3.7-foss-2023a

#converting files from vcf
plink --vcf ../vcf/filtered/dog.vcf.gz --double-id --allow-extra-chr --make-bed --out ../plink/raw
