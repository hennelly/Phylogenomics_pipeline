#!/usr/bin/env bash
#SBATCH --job-name=spastral
#SBATCH -c 1
#SBATCH --time 10:10:00
#SBATCH --mem-per-cpu 5G
#SBATCH -o /home/crq857/projects/Geneflow_Dogs/slurmout/astral_auto_byspecies_atry2ll_feb9_annotate.out
#SBATCH -e /home/crq857/projects/Geneflow_Dogs/slurmout/astral_auto_byspecies_atry2ll_feb9_annotate.err

ls *.treefiles > listoftreefiles.txt #get a list of the 5000 trees

java -jar /projects/mjolnir1/people/crq857/Chapter2/bin/ASTER/ASTRAL/astral.5.7.8.jar --branch-annotate 1 -i listoftreefiles.txt -o full_Feb9_try2_autosomes_branchannotate.tre

