#!/bin/bash
#SBATCH --partition=defq
#SBATCH --job-name=GWAS
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=100g
#SBATCH --time=48:00:00
#SBATCH --mail-user=[YOUR-EMAIL]
#SBATCH --mail-type=ALL

#load in plink
module load plink-uoneasy/2.00a3.7-foss-2023a

#create a dedicated GWAS directory
mkdir ../GWAS

#Run GWAS
plink --bfile ../plink/qc/qc --allow-extra-chr --allow-no-sex --pheno ../phenotype_data/ind_pheno.txt --all-pheno --linear --out ../GWAS
