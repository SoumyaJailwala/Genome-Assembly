genome=../Rubricatochromis_exsul/RE_male_final/RE_male_genome_v1.fasta
output_dir="../Rubricatochromis_exsul/RE_tidk"
telomere_string="AACCCT"

tidk search \
	--string $telomere_string \
	--output $output_dir/$telomere_string \
	--dir ./ \
	--extension tsv \
	$genome
tidk plot \
	--tsv $output_dir/${telomere_string}_telomeric_repeat_windows.tsv \
	-o $output_dir/$telomere_string
