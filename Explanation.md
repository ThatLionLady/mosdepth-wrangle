# Code Explanation

- Create column headers then output to a file to be made in the **argument 3** directory:

```sh
echo -e "Sample \t chrom \t length \t bases \t mean \t min \t max" >> ${DIR}mosdepth-summaries
```

- For loop through all samples in **argument 1** list:

```sh
for sample in $SAMPLES; do
```

- each line in the for loop assigns the results value to each parameter:

  ```sh
  LENGTH=$(awk -v CHROM=${CHROM} '$1 == CHROM {print $2}' ${SUMDIR}${SAMPLE}.mosdepth.summary.txt)
  ```

  - assign (`print`) the value from the 2nd column (`$2`) for the row where the 1st column (`$1`) equals (`==`) the chromosome/region (`-v CHROM=${CHROM}`) specified in **argument 2** from the [mosdepth](https://github.com/brentp/mosdepth) summary file in the **argument 4** directory (`${sumdir}${sample}.mosdepth.summary`) to the *variable* `LENGTH` 

- Output the results into columns:

```sh
echo -e "${SAMPLE} \t ${CHROM} \t ${LENGTH} \t ${BASES} \t ${MEAN} \t ${MIN} \t ${MAX}" >> ${DIR}mosdepth-summaries
```

- And done!

```sh
done
```