#!/usr/bin/env bash
#SBATCH --job-name=ASTRAL
#SBATCH -c 1
#SBATCH --time 00:40:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Geneflow_Dogs/slurmout/vcf2python_fullgenome_%A_%a.out
#SBATCH -e /home/crq857/projects/Geneflow_Dogs/slurmout/vcf2python_fullgenome_%A_%a.err
#SBATCH --array=1-5000%10

#conda activate /projects/mjolnir1/apps/conda/python-3.5.6

cd /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/input_March2024/
#ls > /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/input_March2024/listfiles.txt

FILE=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/input_March2024/listfiles.txt)

DIR=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/input_March2024
OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/phyfiles_autosomes_all_March2024
VCF=/projects/mjolnir1/people/crq857/Chapter2/06_Datasets/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl.recode.vcf

#add header 
grep "#" ${VCF} > header_autosomes.txt
cat header_autosomes.txt ${DIR}/${FILE} > ${DIR}/${FILE}_header.vcf
rm ${DIR}/${FILE}

python /projects/mjolnir1/people/crq857/Geneflow_Dogs/bin/vcf2phylip/vcf2phylip.py -i ${DIR}/${FILE}_header.vcf --output-folder ${OUTDIR} --output-prefix ${FILE}_phy -o Dhole_BerlinZoo
