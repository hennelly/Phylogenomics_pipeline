#!/usr/bin/env bash
#SBATCH --job-name=ASTRAL
#SBATCH -c 1
#SBATCH --time 01:40:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Geneflow_Dogs/slurmout/iqtree_fullgenome_run_%A_%a.out
#SBATCH -e /home/crq857/projects/Geneflow_Dogs/slurmout/iqtree_fullgenome_run_%A_%a.err
#SBATCH --array=1-5000%10

#conda activate /projects/mjolnir1/apps/conda/python-3.5.6

/home/crq857/bin/iqtree-1.6.12-Linux/bin/iqtree -s autosomes_filtered.phy -bb 1000 -nt AUTO -m MFP

# you may need to download iqtree: http://www.iqtree.org/
# the -m flag is to decide which substitution model best fits the data. The MFP flag is telling iqtree to estimate which model is best
# the -bb flag is for bootstrapping. The 1000 tells iqtree to do 1000 bootstrap replicates
