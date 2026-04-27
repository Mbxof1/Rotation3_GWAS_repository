#!/bin/bash
#SBATCH --partition=defq
#SBATCH --job-name=makebam
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --mem=30g
#SBATCH --time=10:00:00
#SBATCH --output=/share/BioinfMSc/life4136_2526/rotation3/group5/scripts/logs/slurm/slurm-%x-%j.out
#SBATCH --error=/share/BioinfMSc/life4136_2526/rotation3/group5/scripts/logs/slurm/slurm-%x-%j.err
#SBATCH --mail-user=mbxof1@nottingham.ac.uk
#SBATCH --mail-type=begin
#SBATCH --mail-type=fail
#SBATCH --mail-type=end
#SBATCH --array=0-114


#sourcing home bash profile
source $HOME/.bash_profile

#activating environment
conda activate rotation3

#Loading software
module load samtools-uoneasy/1.18-GCC-12.3.0
module load bwa-uoneasy/0.7.17-GCCcore-12.3.0
module load picard-uoneasy/3.0.0-Java-17

#loading the samples into an array
mapfile -t ROOTS < /share/BioinfMSc/life4136_2526/rotation3/group5/names.txt

# Get the current sample name based on SLURM_ARRAY_TASK_ID
SAMPLE=${ROOTS[$SLURM_ARRAY_TASK_ID]}


#Set file paths
#Fastp trimmed reads
FILE1=/share/BioinfMSc/Hannah_resources/doggies/fastqs/${SAMPLE}_1.fastq.gz
FILE2=/share/BioinfMSc/Hannah_resources/doggies/fastqs/${SAMPLE}_2.fastq.gz


# Reference genome
REF=/share/BioinfMSc/life4136_2526/rotation3/group5/dog_reference/GCF_011100685.1_UU_Cfam_GSD_1.0_genomic.fna


# Outfile
cd /share/BioinfMSc/life4136_2526/rotation3/group5/
mkdir -p bam
OUTFILE=bam/${SAMPLE}.sort.bam

#aligning reads
        echo "Aligning ${SAMPLE} with bwa"
        bwa mem -M -t 8 $REF $FILE1 \
        $FILE2 | samtools view -b | \
        samtools sort -T ${SAMPLE} > $OUTFILE

# Use picard to remove "duplicates" - a duplicate read is a sequence that is exactly the same in both the forward and reverse directions
# A duplicate read in Illumina (or other short-read sequencing) refers to a read that is an exact copy of another read in the dataset, typically originating from the same original DNA fragment. 
# These duplicates are usually PCR duplicates, created during the amplification step in library preparation rather than representing independent molecules from the sample.
# Duplicates inflate read counts, making coverage appear higher than it truly is.
# Multiple identical reads from the same fragment can make a variant look more supported than it is.

java -jar $EBROOTPICARD/picard.jar \
MarkDuplicates REMOVE_DUPLICATES=true \
ASSUME_SORTED=true VALIDATION_STRINGENCY=SILENT \
MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=1000 \
INPUT="$OUTFILE" \
OUTPUT=bam/${SAMPLE}.rmd.bam \
METRICS_FILE=bam/${SAMPLE}.rmd.bam.metrics
samtools index bam/${SAMPLE}.rmd.bam
rm $OUTFILE
