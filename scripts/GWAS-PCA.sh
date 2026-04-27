#!/bin/bash
#SBATCH --partition=defq
#SBATCH --job-name=GWAS
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=100g
#SBATCH --time=48:00:00
#SBATCH --output=/share/BioinfMSc/life4136_2526/rotation3/group5/scripts/logs/slurm/slurm-%x-%j.out
#SBATCH --error=/share/BioinfMSc/life4136_2526/rotation3/group5/scripts/logs/slurm/slurm-%x-%j.err

source $HOME/.bash_profile

#load in plink
module load plink-uoneasy/2.00a3.7-foss-2023a

#Run GWAS
plink --bfile ../plink/qc/dog_qc --allow-extra-chr --allow-no-sex --pheno ../phenotype_data/ind_pheno_weight.txt --covar ../plink/pca/pca20.eigenvec --covar-number 1-3 --linear --out ../phenotype_data/gwas_weight_pca3
