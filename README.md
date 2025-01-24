# Cracking the Cichlid Code: A Genome Assembly Workflow
From June 2024 to early 2025, I had the wonderful opportunity to work with the Kocher Biology Lab at the University of Maryland. I worked under Professor Tom Kocher and my mentor Kristen Behrens as we wrapped up the lab's final projects, focusing on genome assembly and uncovering patterns in sex determination in cichlids (fish!). Here, I showcase the process of genome assembly and some scripts I wrote to automate steps in the workflow. 

Feel free to take look at [some scripts I've written!](My_Scripts/) I used Bash to script and automate tasks within a Unix environment.


## A Walkthrough
Let's walk through the process with an example genome -- we'll see if we can piece together the data from a female Rubricatochromis exsul -- here's what she might look like, by the way:

<img src="https://www.fishbase.se/images/species/Heexs_f1.jpg" width="500">


## Step 1: Initial Assembly
First, we take the raw sequencing reads and use a script to run a fast de novo assembler called [Hifiasm](https://github.com/chhylp123/hifiasm). The output is a .gfa file, a tab-delimited text format to describe sequences and their overlap. We can easily take a look at the initial assembly with [Bandage](https://rrwick.github.io/Bandage/) which is a neat tool for visualising de novo assembly graphs. Let's see how our assembly looks:

<img src="Example_Genome_Data/Bandage.png" width="700">

Hm, looks pretty solid! We now have a set of contigs, which are continuous sequences of DNA formed by joining overlapping fragments. Now, we save each contig (excluding the smaller ones that are < 2 Mb) to prepare for the next steps :)

## Align Against a Reference
Now, to figure out how to accurately piece these contigs together into distinct linkage groups (another word for chromosomes - cichlids have 22!), we align against a reference genome using [Dgenies](https://dgenies.toulouse.inra.fr/), a wonderful tool that visualizes genome alignments. It uses minimap2 and produces a plot; Here's an initial alignment of all of our saved Rubricatochromis contigs against an Oreochromis Aureus reference:

<img src="Example_Genome_Data/map_Female_large_contigs_to_O_aureus_ZZ.png" width="700">

You can get a more interactive look as well with this [live viewer](Example_Genome_Data/Female_large_contigs_O_aureus_ZZ_RE_F.html).

Cool! We can now see which linkage group each contig aligns to, and how well it aligns. 


## Breaking, Reversing, Joining Contigs

Let's take a closer look at LG5.

<img src="Example_Genome_Data/LG5.png" width="400">

It looks like we have both contig8 and contig9 aligning to this linkage group. There's a few steps we need to take before joining the two.

First, if we look closer at contig9:

<img src="Example_Genome_Data/map_female_contig9_to_O_aureus_ZZ.png" width="400">

only part of it is aligning to LG5 and the other is aligning all the way to LG13. This means we'll have to split the contig:

`
`



Reversing like so:
`seqkit seq -r -p -t DNA female_contig9_part1.fasta -o female_contig9_part1_reversed.fasta`

Now, we have to join the two contigs together - but each .fasta file has a header line, and we don't want both the headers in the final output. So, we use `grep` to remove the header of the second contig, contig8:

`grep -v ">" female_contig8.fasta > female_contig8_noheader.fasta`
cat female_contig20.fasta Ns.fasta female_contig31_reversed_noheader.fasta > female_contig20_31_reversed.fasta 





## Telomere Analysis
Telomeres are repetive sequnces at the end of chromsoems 




[Dgenies](https://dgenies.toulouse.inrae.fr/).
