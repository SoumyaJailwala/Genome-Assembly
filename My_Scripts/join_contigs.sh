#!/bin/bash

# Usage example: 'bash join_contigs.sh male 3 true 24 false'

## variables: given in command
sex=$1
contig1=$2
reverse1=$3
contig2=$4
reverse2=$5

## CHANGE DIRECTORY BASED ON YOUR GENOME!
cd /Volumes/Extreme\ Pro/Soumya_Genomes/Tylochromis_lateralis/Male_contigs/

## names of contig files (eg "male_contig2" and "male_contig17")
contig1_file=${sex}_contig${contig1}
contig2_file=${sex}_contig${contig2}

## reverses contig 1 if needed, contig1_file would then become "male_contig2_reversed"
if [ "$reverse1" = true ]; then
seqkit seq -r -p -t DNA ${contig1_file}.fasta -o ${contig1_file}_reversed.fasta
contig1_file=${contig1_file}_reversed
fi

## reverses contig 2 if needed, contig2_file would then become "male_contig17_reversed"
if [ "$reverse2" = true ]; then
seqkit seq -r -p -t DNA ${contig2_file}.fasta -o ${contig2_file}_reversed.fasta
contig2_file=${contig2_file}_reversed
fi

## removes header of contig 2 (uses reversed contig 2 if it was reversed)
grep -v ">" ${contig2_file}.fasta > ${contig2_file}_noheader.fasta

## extracts just the last part of contig 2 (eg "17_reversed" or just "17" if not reversed)
suffix_only=${contig2_file#*_contig}

## combines the two using appropriate names, variables and final file will all reflect any reversals
cat ${contig1_file}.fasta Ns.fasta ${contig2_file}_noheader.fasta > ${contig1_file}_${suffix_only}.fasta
