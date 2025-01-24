### This script takes two inputs to break a contig into two parts. contig_name should just be the 
### contig number, and breakpoint is the point at which it should be broken. The output will be
### in the form 'contig20_part1.fasta' and 'contig20_part2.fasta', for example.
# Note - header must be in form '>NODE_ptg000002l+_length_32996310_cov_1'

# Usage example: 'bash split_contig.sh 30 5700000' will split contig 30 at 5.7 Mb

contig_name=$1
breakpoint=$2

if [[ -z "$contig_name" || -z "$breakpoint" ]]; then
  echo "Usage: bash split_contig.sh <contig_name> <breakpoint>"
  exit 1
fi

# Extract header with grep, and remove ">" from it using sed
header=$(grep ">" ${contig_name}.fasta | sed 's/^>//')

# Get length from header
length=$(echo "$header" | sed -n 's/.*_length_\([0-9]*\)_cov_.*/\1/p')

seqtk subseq ${contig_name}.fasta <(echo -e "${header}\t0\t${breakpoint}") > ${contig_name}_part1.fasta
seqtk subseq ${contig_name}.fasta <(echo -e "${header}\t${breakpoint}\t${length}") > ${contig_name}_part2.fasta

echo "Successfully split ${contig_name}.fasta at ${breakpoint} Mb!"
echo $(grep ">" ${contig_name}_part1.fasta)
echo $(grep ">" ${contig_name}_part2.fasta)
