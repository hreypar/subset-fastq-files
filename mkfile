< config.mk
# subset fastq file
# it would be cool to check with zcat and wc -l
# if the file has more lines than requested
#
# it would also be cool to add separated recipes
# for paired end and single end reads files
#
results/%.subset.fastq.gz:Q: data/%.fastq.gz
	mkdir -p `dirname $target`
	seqtk sample \
		$SEED \
		$prereq \
		$NUMBER_OF_READS \
	| gzip -f -9 \
	> $target'.build' \
	&& mv $target'.build' $target
