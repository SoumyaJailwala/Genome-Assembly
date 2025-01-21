# Takes in a genome, outputs headers in form of "LG1", "LG2", .. etc. (SKIPS LG21)
 
original_genome=../Steatocranus_casuarius/SC_male_final/Versions/SC_male_genome_v2.fasta
output_dir="../Steatocranus_casuarius/SC_male_final/Versions"
new_name="SC_male_genome_v2_headers.fasta"

awk '/^>/ {count++; if (count == 21) {count ++;} print ">LG" count; next} {print}' "$original_genome" > "$output_dir/$new_name"
