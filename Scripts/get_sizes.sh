#!/bin/bash

### This script outputs a txt file with LG names and their individual sizes.
### It won't be sorted :( but you can use the output to put this into sheets/excel and get the running sizes

## change to directory you want output in
cd "/Volumes/Extreme Pro/Soumya_Genomes/Steatocranus_casuarius/SC_male_final"

## change to folder with the final LGs, and desired name of output file

folder="/Volumes/Extreme Pro/Soumya_Genomes/Steatocranus_casuarius/SC_male_final/Final_LGs"
output_file="StcraMale_ind_chr_size.txt"


> "$output_file"

for file in "$folder"/*.fasta; do

LG_name=$(basename "$file" | cut -d'_' -f1)

LG_size=$(grep -v "^>" "$file" | wc -c)

echo -e "${LG_name}\t${LG_size}" >> "$output_file"

done

