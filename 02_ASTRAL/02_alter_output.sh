#!/usr/bin/env bash
#SBATCH --job-name=astral
#SBATCH -c 1
#SBATCH --time 00:10:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout_Oct/test.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout_Oct/test.err

#write each line of bed file as its own file
mkdir Randomregions
cd Randomregions

awk '!/^$/{print  > "File_"NR".txt" }' randomregions.txt

## This now gets a bit tedious. We need to write each line of the file containing the 5000 random regions coordinates to its own individual file. This is for getting the next script to work properly. 
## The output will be 5000 individual files labled File_1.txt File_2.txt File_3.txt, etc. 

ls > listofpositions.txt

## This next script now makes a list of all these individual files into one file where each line is File_1.txt File_2.txt File_3.txt, etc. We are making this to run an array in the next script. 
