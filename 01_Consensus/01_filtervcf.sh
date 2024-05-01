#!/usr/bin/env bash
#SBATCH --job-name=astral
#SBATCH -c 1
#SBATCH --time 1:10:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Geneflow_Dogs/slurmout/bedtoolsrandom_chrX.out
#SBATCH -e /home/crq857/projects/Geneflow_Dogs/slurmout/bedtoolsrandom_chrX.err

##Obtain a vcf that has a minimum depth filter, only certain individuals from each species, exclude non-variant sites and only a specific chromosome 

module load vcftools

vcftools --vcf autosomes.vcf --keep ${SAMPLES} \
--minDP xx \ #minimum depth filter
--chr chrXXX \ #subset chromosome
--minQ xxx \ #minimum quality filter - usually we do 30 or 20
--remove-indels \ #remove indels
--min-alleles 2 \ # keeping biallelic snps
--max-alleles 2 \ # keeping biallelic snps
--non-ref-ac-any 1 \ # remove non-invariantsites
--max-missing xxx \ #keep only sites that have a certain percentage of individuals present - such if 0.9, this means to keep sites that have at least 90% of individuals have data
--recode \
--recode-INFO-all \
--out autosomes_filtered

