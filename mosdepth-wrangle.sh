#!/bin/sh

SAMPLES=$(<$1) 	# /PATH/TO/List-of-Samples.txt
CHROM=$2		# Chromosome/Region
DIR=$3 			# /PATH/OF/MAIN/DIRECTORY/
SUMDIR=$4 		# /PATH/WITH/PALEOMIX/SUMMARIES/

echo "Compiling mosdepth summaries"

echo -e "Sample \t chrom \t length \t bases \t mean \t min \t max" >> ${DIR}mosdepth-summaries

for SAMPLE in $SAMPLES; do
	LENGTH=$(awk -v CHROM=${CHROM} '$1 == CHROM {print $2}' ${SUMDIR}${SAMPLE}.mosdepth.summary.txt)
	BASES=$(awk -v CHROM=${CHROM} '$1 == CHROM {print $3}' ${SUMDIR}${SAMPLE}.mosdepth.summary.txt)
	MEAN=$(awk -v CHROM=${CHROM} '$1 == CHROM {print $4}' ${SUMDIR}${SAMPLE}.mosdepth.summary.txt)
	MIN=$(awk -v CHROM=${CHROM} '$1 == CHROM {print $5}' ${SUMDIR}${SAMPLE}.mosdepth.summary.txt)
	MAX=$(awk -v CHROM=${CHROM} '$1 == CHROM {print $6}' ${SUMDIR}${SAMPLE}.mosdepth.summary.txt)

	echo -e "${SAMPLE} \t ${CHROM} \t ${LENGTH} \t ${BASES} \t ${MEAN} \t ${MIN} \t ${MAX}" >> ${DIR}mosdepth-summaries
done
