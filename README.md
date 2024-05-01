# Phylogenomics_pipeline
Pipeline for phylogenomic analyses for the autosomes

## 01 Consensus autosomal phylogeny
- This method will take all use all the autosomal SNPs in a single analysis to infer one single phylogenetic tree. This consensus autosomal tree using all the data is similar to generating an average  of all individual "gene trees" across the genome.



## 02 Sliding window autosomal phylogeny using ASTAL

- This approach consists of two steps. The first is to infer many trees in specific genomic regions across the genome. The second step is to find which trees are most prevalent among all the trees we generated across all the genomic regions. The most common tree is often the "species tree", as in the historical relationships between species.

- You can find the ASTRAL paper here: https://bmcbioinformatics.biomedcentral.com/articles/10.1186/s12859-018-2129-y#Sec31
