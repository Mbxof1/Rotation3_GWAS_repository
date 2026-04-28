# Rotation3_GWAS_repository
A collection of scripts and instructional files to guide the user through a GWAS analysis

For the purpose of this pipeline, scripts have been made generic whereever possible, in order to facilitate analysis of datasets other than the one we worked on.

All analysis except for graphing in R was performed using the University of Nottingham Ada HPC. Some tasks were performed using modules preinstalled on the HPC, whilst others utilised modules installed within a conda environment. Required modules are listed below:
HPC preinstalled modules:

Conda environment modules:


In order to perform a GWAS analysis, the following data will be required:
Phenotype data associated with the samples. This should be orginised in a .txt file, with spaces separating columns. Columns should be labelled 
Biological data for the samples, either in the form of Fasta or VCF files. 
A reference genome, in fasta or fastq file format.


. if working from fastq files, place them into the Data_folder and proceed to step 2. if working with VCF files, 

. place the reference genome into the Reference_genome folder

. run sample_names.sh, making modifications to the script if the sample name contains _ characters that must not be trimmed. An example of the output names.txt file is provided

. run makebam.sh

