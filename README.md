# Cracking the Cichlid Code: A Genome Assembly Workflow
From June 2024 to early 2025, I had the wonderful opportunity to work with the Kocher Biology Lab where they focus on evolutionary traits and patterns in cichlids (fish!). I worked under Professor Tom Kocher and my mentor Kristen Behrens as we wrapped up the lab's final projects. My main contribution was genome assembly, so I want to showcase the process and some of the scripts I was able to write to automate certain steps in the workflow. 

## Assembling the 


## Assembling the 

Let's walk through the process with an example genome -- we'll take Rubricatochromis exsul, 

[You can view more here:](/Example_Genome_Data/map_Female_large_contigs_to_O_aureus_ZZ.png)

Reversing like so:
`seqkit seq -r -p -t DNA female_contig9.fasta -o female_contig9_reversed.fasta`

Now, we have to join the two contigs together - but each .fasta file has a header line, and we don't want both the headers in the final output. So, we use `grep` to remove the header of the second contig, contig8:

`grep -v ">" female_contig8.fasta > female_contig8_noheader.fasta`
cat female_contig20.fasta Ns.fasta female_contig31_reversed_noheader.fasta > female_contig20_31_reversed.fasta 


<img src="Example_Genome_Data/map_Female_large_contigs_to_O_aureus_ZZ.png" width="600">

<img src="https://www.aquaportail.com/pictures2311/male-rubricatochromis-exsul-hemichromis.jpg" width="500">


[Dgenies](https://dgenies.toulouse.inrae.fr/).
