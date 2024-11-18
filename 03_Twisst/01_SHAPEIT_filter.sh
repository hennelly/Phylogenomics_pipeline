#!/bin/bash -l
#SBATCH --job-name=shapeit
#SBATCH --nodes 1
#SBATCH --ntasks 1
#SBATCH --time 2-10:00:00
#SBATCH --mem=8GB
#SBATCH -p high
#SBATCH -o /home/hennelly/Redwolf/slurmout/01_shapeit_March12_filter.out
#SBATCH -e /home/hennelly/Redwolf/slurmout/01_shapeit_March12_filter.err

DIR=/group/ctbrowngrp2/yote/mccleerywolves/vcf_all/filtered
FILE=working_20231205_mpileup_autosomes_filterA3_all.vcf.gz
OUTDIR=/group/ctbrowngrp2/hennelly/hennelly/Redwolf/files
OUT=working_20231205_mpileup_autosomes_filterA3_all_biallelic_maxmiss0.90_March12
KEEP=/home/hennelly/Redwolf/files/keep_modern_March12.txt
# Filter
module load vcftools 

vcftools --gzvcf ${DIR}/${FILE} \
--min-alleles 2 \
--max-alleles 2 \
--max-missing 0.90 \
--remove-indels \
--keep ${KEEP} \
--out ${OUTDIR}/${OUT} \
--recode \
--recode-INFO-all
