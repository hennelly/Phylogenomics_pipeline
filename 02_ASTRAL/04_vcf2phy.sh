#!/usr/bin/env bash
#SBATCH --job-name=ASTRAL
#SBATCH -c 1
#SBATCH --time 00:40:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Geneflow_Dogs/slurmout/vcf2python_fullgenome_%A_%a.out
#SBATCH -e /home/crq857/projects/Geneflow_Dogs/slurmout/vcf2python_fullgenome_%A_%a.err
#SBATCH --array=1-5000%10

#conda activate /projects/mjolnir1/apps/conda/python-3.5.6

cd input
ls *.vcf > list_of_vcffiles.txt #like last time, we want to obtain a list of the vcf files so we can run an array

RANDOMVCF=$(sed "${SLURM_ARRAY_TASK_ID}q;d" list_of_vcffiles.txt) #this is the specific script to tell the cluster to run an array. 

DIR=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/input_March2024
OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/phyfiles_autosomes_all_March2024
VCF=/projects/mjolnir1/people/crq857/Chapter2/06_Datasets/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl.recode.vcf

#add header 
grep "#" autsomes.vcf > header_autosomes.txt #Each randomly generated vcf file does not have a header, so we need to add that first
cat header_autosomes.txt ${RANDOMVCF} > ${RANDOMVCF}_header.vcf

python /projects/mjolnir1/people/crq857/Geneflow_Dogs/bin/vcf2phylip/vcf2phylip.py -i ${RANDOMVCF}_header.vcf --output-folder ${OUTDIR} --output-prefix ${RANDOMVCF}_phy -o Dhole_BerlinZoo
#Now we can run the script to convert each of the 5000 vcf files to phy files. 
#the -o is to indicate the outgroup taxa
