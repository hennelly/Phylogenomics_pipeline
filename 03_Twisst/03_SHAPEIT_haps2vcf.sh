#!/usr/bin/env bash
#SBATCH --job-name=shapeit
#SBATCH --nodes 1
#SBATCH --ntasks 1
#SBATCH --time 12:00:00
#SBATCH --mem=10GB
#SBATCH -o /home/hennelly/Redwolf/slurmout/01_shapeit_haps2vcf_%A_%a.out
#SBATCH -e /home/hennelly/Redwolf/slurmout/01_shapeit_haps2vcf_%A_%a.err
#SBATCH -p high
#SBATCH --array=1-39


echo "My SLURM_ARRAY_TASK_ID: " $SLURM_ARRAY_TASK_ID
CHR=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /home/hennelly/Redwolf/files/chrlist.txt | cut -f1)

#convert haps to vcf

/group/ctbrowngrp2/hennelly/hennelly/Pakistan_Graywolf_Genomics/Selection/Genes/IGF1region/shapeit/shapeit.v2.904.3.10.0-693.11.6.el7.x86_64/bin/shapeit -convert  --input-haps /group/ctbrowngrp2/hennelly/hennelly/Redwolf/phaseddata_March13/working_20231205_mpileup_autosomes_filterA3_all_biallelic_maxmiss0.90_March12_bestind_phased_chr${CHR}  --output-vcf /group/ctbrowngrp2/hennelly/hennelly/Redwolf/phaseddata_March13/working_20231205_mpileup_autosomes_filterA3_all_biallelic_maxmiss0.90_March12_bestind_phased_chr${CHR}.vcf
