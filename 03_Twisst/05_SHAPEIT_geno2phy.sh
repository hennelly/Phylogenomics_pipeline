#!/usr/bin/env bash
#SBATCH --job-name=twisst
#SBATCH --array=1
#SBATCH --nodes 1
#SBATCH --ntasks 1
#SBATCH --time 3-12:00:00
#SBATCH --mem=40GB
#SBATCH -o /home/hennelly/Redwolf/slurmout/02_Apr2twisst_March28_final_nnewtwisst.out
#SBATCH -e /home/hennelly/Redwolf/slurmout/02_Apr2twisst_March28_final_nnewtwisst.err
#SBATCH -p high

echo "My SLURM_ARRAY_TASK_ID: " $SLURM_ARRAY_TASK_ID
CHR=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /home/hennelly/Redwolf/files/chrlist.txt | cut -f1)

OUTDIR=/group/ctbrowngrp2/hennelly/hennelly/Redwolf/files_May

conda activate ete3_python3

python3 /home/hennelly/Redwolf/bin/twisst/twisst.py -t ${TREES} -w ${OUTDIR}/working_20231205_mpileup_chrX_filterA3_all_biallelic_maxmiss0.9_remove_${CHR}_phased.csv.gz -g Easternwolf -g Coyote -g GraywolfNA -g GraywolfEur -g Dhole --outgroup Dhole --method complete --groupsFile samplelisttwisst_Apr3_${CHR}.txt 
