# Cracking the Cichlid Code: A Genome Assembly Workflow
From June 2024 to early 2025, I had the wonderful opportunity to work with the Kocher Biology Lab where they focus on evolutionary traits and patterns in cichlids (fish!). I worked under Professor Tom Kocher and my mentor Kristen Behrens as we wrapped up the lab's final projects. My main contribution was genome assembly, so I want to showcase the process and some of the scripts I was able to write to automate certain steps in the workflow. 
## Assembling the 
iioo
## Assembling the 


![map_Female_large_contigs_to_O_aureus_ZZ](https://github.com/user-attachments/assets/2a3422d2-d642-4f0d-832b-8504dfa15a0f)


[You can view more here:](/Example_Genome_Data/map_Female_large_contigs_to_O_aureus_ZZ.png)

Reversing like so:
`seqkit seq -r -p -t DNA female_contig3.fasta -o female_contig3_reversed.fasta`
