#!/usr/bin/env bash
#SBATCH --job-name=twisst
#SBATCH --array=1
#SBATCH --nodes 1
#SBATCH --ntasks 1
#SBATCH --time 3-12:00:00
#SBATCH --mem=40GB
#SBATCH -o /home/hennelly/Redwolf/slurmout/02_Apr2twisst_March28_final_nnewtwisst_%A_%a.out
#SBATCH -e /home/hennelly/Redwolf/slurmout/02_Apr2twisst_March28_final_nnewtwisst_%A_%a.err
#SBATCH -p high
#SBATCH --array=1-38

echo "My SLURM_ARRAY_TASK_ID: " $SLURM_ARRAY_TASK_ID
CHR=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /home/hennelly/Redwolf/files/chrlist.txt | cut -f1)

DIR=/group/ctbrowngrp2/hennelly/hennelly/Redwolf/phyfiles_Apr4
OUTDIR=/group/ctbrowngrp2/hennelly/hennelly/Redwolf/phyfiles_Apr4

conda activate ete3_python3

python3 /home/hennelly/Redwolf/bin/twisst/twisst.py -t ${DIR}/working_20231205_mpileup_autosomes_filterA3_all_biallelic_maxmiss0.95_March13_window1_chr${CHR}_noRedwolftry3.phyml.trees.gz -w ${OUTDIR}/output.weights_chr${CHR}_root_March27_Eastern_coyote_Wolf_newtwisstApr4_try2.csv.gz -g Easternwolf -g Coyote -g GraywolfNA -g GraywolfEur -g Dhole --outgroup OG_dhole_SRR8049189_A --method complete --groupsFile samplelisttwisst_Apr3.txt 
