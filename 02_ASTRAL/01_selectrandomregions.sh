#!/usr/bin/env bash
#SBATCH --job-name=astral
#SBATCH -c 1
#SBATCH --time 1:10:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Geneflow_Dogs/slurmout/bedtoolsrandom.out
#SBATCH -e /home/crq857/projects/Geneflow_Dogs/slurmout/bedtoolsrandom.err

GENOME=/projects/mjolnir1/people/crq857/Chapter2/ref/canFam31.fasta.fai

module load bedtools 

bedtools random -g ${GENOME} -l 20000 -n 5000 

#This script is using the dog reference genome to select 5000 random regions that are 20kb in length. This script will output a list of 5000 regions in the form of the start and end position on each line. 
