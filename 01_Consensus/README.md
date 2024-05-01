## Consensus phylogeny

- To generate the consensus autosomal phylogeny, we need to (1) filter the vcf, (2) convert the vcf to phy, and (3) use the phy as input to infer the best model and phylogeny using iqtree

- IQ-tree takes a long time if you use all the autosomal SNPs! You can practice to make sure the entire pipeline works by using just a single chromosome first. You can also then look at the iqtree output of that single chromosome to see the phylogenetic tree and other outputs from iqtree. Once the pipeline works, you can use the autosomes with allocated a lot of time to finish the analysis (15 days or more). 
