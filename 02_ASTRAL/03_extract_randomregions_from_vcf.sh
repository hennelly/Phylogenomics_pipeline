#!/usr/bin/env bash
#SBATCH --job-name=astral
#SBATCH -c 1
#SBATCH --time 01:10:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout_Oct/astral_extract_%A_%a.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout_Oct/astral_extract_%A_%a.err
#SBATCH --array=10-5000%10

RANDOMREGION=$(sed "${SLURM_ARRAY_TASK_ID}q;d" list_of_random_positions.txt)

mkdir input #make a directory to store the 5000 vcf files
cd input

module load bedtools

bedtools intersect -a autosomes.vcf -b ${RANDOMREGION} > autosomes_${RANDOMREGION}.vcf

#This script extracts the start and end positions of the 5,000 random regions generated by the previous script from your autosomal vcf file. 
# We are using an ARRAY, which will run multiple scripts at one time. We are running this array so that we can extract each of the listed genomic regions from the autosomal vcf file to then infer trees. 
