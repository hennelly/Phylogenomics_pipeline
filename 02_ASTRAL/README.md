# Inferring autosomal phylogeny with ASTRAL 


- Select 20,000kb length segments at 5,000 random region -> [01_selectrandomregions.sh](/02_ASTRAL/01_selectrandomregions.sh)
    - I then cd into the directory where all the random regions are located, and did 'ls > list_randomregions.txt'. This gives me a list of regions so I can run an array

- Subset the vcf files to include only the 20,000kb length segments at 5,000 random regions -> [03_extract_randomregions_from_vcf.sh](/02_ASTRAL/03_extract_randomregions_from_vcf.sh)
    - I then cd into the directory where all the vcfs of random regions are located, and did `ls > list_vcffiles.txt`. This gives me a list of vcfs of the 5,000 regions so I can run an array

- Convert each of the 5,000 vcfs to a phy file -> [04_vcf2phy.sh](/02_ASTRAL/04_vcf2phy.sh)
   - This involves adding a header to each vcf file
   - I then cd into the directory where all the phy files are located, and did `ls > list_phylist.txt`. This gives me a list of phy of the 5,000 regions so I can run an array
    
- Run IQtree on each of the phy files -> [05_phy2iqtree.sh](/02_ASTRAL/05_phy2iqtree.sh)
    - I then wrote an individual script to do `cat *treefile > alltreefiles.txt` to have a list of all final treefiles to run ASTRAL
- Run ASTRAL on iqtree output -> [06_runASTRAL.sh.sh](/02_ASTRAL/06_runASTRAL.sh.sh)
    - There are different outputs:
         - the `-q` option will give estimates of the branch length and local posterior support for each branch. Local posterior support probabilities are computed based on the gene tree quartet frequencies. The probability refers to the probability the branch is the true branch given the set of gene trees.
         - For me, I was interested in only certain nodes, and will then look at the probability at these specific nodes. 

scp -r crq857@mjolnirhead01fl.unicph.domain:/home/crq857/projects/Chapter2/scripts_Dec/out_autosomes.tre ~/Desktop #you can also move the output to your desktop to play around with the output
