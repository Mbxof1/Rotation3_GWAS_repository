#!/bin/bash
#SBATCH --partition=defq
#SBATCH --job-name=sample_names
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --mem=30g
#SBATCH --time=10:00:00
#SBATCH --mail-user=[YOUR-EMAIL]
#SBATCH --mail-type=begin
#SBATCH --mail-type=fail
#SBATCH --mail-type=end

#pull all the file names from the raw data directory
ls ../raw_data_Folder > file_names.txt

#remove all the contents of the string past the first _
#will remove the _1/2.fasta.gz string from each of the samples
#increase the value of -f if the sample names contain an _ you want to retain
#cut cannot change in place, so we must make a new file here
cut -d_ -f 1 file_names.txt > names.txt

#removes all duplicates, so only one copy of each sample name is left
awk -i inplace '!seen[$0]++' names.txt

#remove the original file name document
rm file_names.txt
