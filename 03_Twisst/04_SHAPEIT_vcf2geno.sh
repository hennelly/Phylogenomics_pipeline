#!/usr/bin/env bash
#SBATCH --job-name=shapeit
#SBATCH --array=1-39
#SBATCH --nodes 1
#SBATCH --ntasks 1
#SBATCH --time 1-12:00:00
#SBATCH --mem=10GB
#SBATCH -o /home/hennelly/Redwolf/slurmout/02_twisst_vcf2geno_March13_%A_%a.out
#SBATCH -e /home/hennelly/Redwolf/slurmout/02_twisst_vcf2geno_March13_%A_%a.err
#SBATCH -p high

echo "My SLURM_ARRAY_TASK_ID: " $SLURM_ARRAY_TASK_ID
CHR=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /home/hennelly/Redwolf/files/chrlist.txt | cut -f1)

OUTDIR=/group/ctbrowngrp2/hennelly/hennelly/Redwolf/genodata_March13/

conda activate ete3

gzip /group/ctbrowngrp2/hennelly/hennelly/Redwolf/phaseddata_March13/working_20231205_mpileup_autosomes_filterA3_all_biallelic_maxmiss0.90_March12_bestind_phased_chr${CHR}.vcf

## Convert to Geno
python /group/ctbrowngrp2/hennelly/hennelly/bin/genomics_general/VCF_processing/parseVCF.py -i /group/ctbrowngrp2/hennelly/hennelly/Redwolf/phaseddata_March13/working_20231205_mpileup_autosomes_filterA3_all_biallelic_maxmiss0.90_March12_bestind_phased_chr${CHR}.vcf.gz --skipIndels | gzip > ${OUTDIR}/working_20231205_mpileup_autosomes_filterA3_all_biallelic_maxmiss0.90_March12_bestind_phased_chr${CHR}.geno.gz
