#!/usr/bin/env bash
#SBATCH --job-name=shapeit
#SBATCH --nodes 1
#SBATCH --ntasks 1
#SBATCH --time 3-12:00:00
#SBATCH --mem=20GB
#SBATCH -o /home/hennelly/Redwolf/slurmout/01_March13_shapeit_chrX.out
#SBATCH -e /home/hennelly/Redwolf/slurmout/01_March13_shapeit_chrX.err
#SBATCH -p high
#SBATCH --array=39

echo "My SLURM_ARRAY_TASK_ID: " $SLURM_ARRAY_TASK_ID
CHR=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /home/hennelly/Redwolf/files/chrlist.txt | cut -f1)

GENEMAPDIR=/group/ctbrowngrp2/hennelly/hennelly/Pakistan_Graywolf_Genomics/RunsofHomozygosity/ROH_bcftools/ANALYSIS_DEC152021/geneticmaps

/group/ctbrowngrp2/hennelly/hennelly/Pakistan_Graywolf_Genomics/Selection/Genes/IGF1region/shapeit/shapeit.v2.904.3.10.0-693.11.6.el7.x86_64/bin/shapeit -M ${GENEMAPDIR}/mark4_cleaned_chr${CHR}.cf3.1.sorted_adjustedforROH.txt --input-vcf /group/ctbrowngrp2/hennelly/hennelly/Redwolf/files_March13/working_20231205_mpileup_autosomes_filterA3_all_biallelic_maxmiss0.90_March12_bestind_chr${CHR}.recode.vcf  -O /group/ctbrowngrp2/hennelly/hennelly/Redwolf/phaseddata_March13/working_20231205_mpileup_autosomes_filterA3_all_biallelic_maxmiss0.90_March12_bestind_phased_chr${CHR} --window 0.5 -T 4 --force
