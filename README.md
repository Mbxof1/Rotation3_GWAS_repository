# Rotation3_GWAS_repository
A collection of scripts and instructional files to guide the user through a GWAS analysis

For the purpose of this pipeline, scripts have been made generic whereever possible, in order to facilitate analysis of datasets other than the one we worked on.

During our GWAS data analysis, we were able to produce VCF files from the provided fastq dataset, and did not have to rely on interpolation of the backup vcf file provided. Due to this, no script for interpolation is provided.

All analysis except for graphing in R was performed using the University of Nottingham Ada HPC. Some tasks were performed using modules preinstalled on the HPC, whilst others utilised modules installed within a conda environment. A .yml file is provided to aid in the recreation of the conda environment, which should be named rotation3 to work with the provided scripts. Required modules and github links are listed below:


HPC preinstalled modules:

samtools-uoneasy/1.18-GCC-12.3.0 - https://github.com/samtools/samtools

bwa-uoneasy/0.7.17-GCCcore-12.3.0 - https://github.com/lh3/BWA

picard-uoneasy/3.0.0-Java-17 - https://github.com/broadinstitute/picard

bcftools-uoneasy/1.19-GCC-13.2.0 - https://github.com/samtools/bcftools

plink-uoneasy/2.00a3.7-foss-2023a - https://github.com/chrchang/plink-ng


Conda environment modules:

fastp - https://github.com/opengene/fastp

fastqc - https://github.com/s-andrews/fastqc

bwa - https://github.com/lh3/BWA


R packages:

qqman - https://github.com/stephenturner/qqman

dplyr - https://github.com/tidyverse/dplyr


In order to perform a GWAS analysis, the following data will be required:
Phenotype data associated with the samples. This should be orginised in a .txt file, with spaces separating 3 columns. The columns should contain sample group data, the sample name and data for the trait being investigated. This file should be placed in the phenotype data folder.
Biological data for the samples, in the form of fastq.gz files. 
A reference genome, in fasta file format.


1. Place fastq.gz files into the raw_data_folder. 

2. place the reference genome into the reference_genome folder alter the index_ref_genome, makebam and bam_to_vcf files, replacing each instance of [REFERENCE_FILE_NAME] with the file name of the reference genome. A list of chromosome names should also be added into the scripts folder, with its name added to the bam_to_vcf file in place of [CHR_NAMES_FOLDER]. An example is provided in the scripts folder. 

3. run sample_names.sh, making modifications to the script if the sample name contains _ characters that must not be trimmed. An example of the output names.txt file is provided

4. run fastp.sh and fastqc.sh

5. run index_ref_sequence.sh

6. run makebam.sh in order to generate bam files from the fastp files.

7. filter the bam files with filter_bam.sh

8. convert the bam files into vcf files using bam_to_vcf.sh

9. concatenate and cleanup the vcf files into a single file using and vcf_concat.sh and vcf_cleanup.sh

10. run convert_vcf.sh to prepare the file for vcf analysis

11. run plink_qc.sh and plink_missingness.sh to qc the vcf files

12. run GWAS.sh. Manhattan plot can be generated at this point, but GWAS-PCA analysis leads to higher quality outputs. Replace [PHENOTYPE_DATA] with the name of your phenotype data .txt file.

13. run ld_prune.sh and pca.sh to generate principal component analysis of dataset.

14. run GWAS-PCA.sh to generate higher quality GWAS output. Replace [PHENOTYPE_DATA] with the name of your phenotype data .txt file.

15. move generated assoc.linear data to local system, then use Manhattan_plotter.R to generate a manhattan plot of the data. Manhattan plot generation requires that chromosomes be named in a 1,2,3 format. An example of how to exchange chromosome names can be found in the Manhattan_plotter.R script. Replace the [GWAS.assoc.linear FILE PATH] placeholder with the path to your local GWAS.assoc.linear download.

If you wish to recieve updates from the sbatch run, replace the [YOUR-EMAIL] placeholder in the .sh file header with your email address.
