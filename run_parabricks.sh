#!/bin/bash

# sh args
OUTPUT_DIR=$1
NUM_GPUS=$2

# variables
REF_DIR="/home/yamaken/reference_hg38"
SAMPLE_DIR="/home/yamaken/sample"
WGSpipeline_DIR="/home/yamaken/WGSpipeline"

# ①fq2bam: Start timing
echo "start_date_time : $(date)" && \
start_time_fq2bam=$(date +%s) && \
pbrun fq2bam --low-memory \
  --ref ${REF_DIR}/Homo_sapiens_assembly38.fasta \
  --in-fq ${SAMPLE_DIR}/NA18945/NA18945_0_1.fastq.gz \
  ${SAMPLE_DIR}/NA18945/NA18945_0_2.fastq.gz \
  "@RG\\tID:NA18945.HCKWTDSXX.1.TAAGTGGT\\tPL:ILLUMINA\\tPU:HCKWTDSXX.1.TAAGTGGT\\tLB:HCKWTDSXX.1.TAAGTGGT\\tSM:NA18945" \
  --in-fq ${SAMPLE_DIR}/NA18945/NA18945_1_1.fastq.gz \
  ${SAMPLE_DIR}/NA18945/NA18945_1_2.fastq.gz \
  "@RG\\tID:NA18945.HCKWTDSXX.2.TAAGTGGT\\tPL:ILLUMINA\\tPU:HCKWTDSXX.2.TAAGTGGT\\tLB:HCKWTDSXX.2.TAAGTGGT\\tSM:NA18945" \
  --in-fq ${SAMPLE_DIR}/NA18945/NA18945_2_1.fastq.gz \
  ${SAMPLE_DIR}/NA18945/NA18945_2_2.fastq.gz \
  "@RG\\tID:NA18945.HCKWTDSXX.3.TAAGTGGT\\tPL:ILLUMINA\\tPU:HCKWTDSXX.3.TAAGTGGT\\tLB:HCKWTDSXX.3.TAAGTGGT\\tSM:NA18945" \
  --in-fq ${SAMPLE_DIR}/NA18945/NA18945_3_1.fastq.gz \
  ${SAMPLE_DIR}/NA18945/NA18945_3_2.fastq.gz \
  "@RG\\tID:NA18945.HCKWTDSXX.4.TAAGTGGT\\tPL:ILLUMINA\\tPU:HCKWTDSXX.4.TAAGTGGT\\tLB:HCKWTDSXX.4.TAAGTGGT\\tSM:NA18945" \
  --in-fq ${SAMPLE_DIR}/NA18945/NA18945_4_1.fastq.gz \
  ${SAMPLE_DIR}/NA18945/NA18945_4_2.fastq.gz \
  "@RG\\tID:NA18945.HFKGLDSXX.1.TAAGTGGT\\tPL:ILLUMINA\\tPU:HFKGLDSXX.1.TAAGTGGT\\tLB:HFKGLDSXX.1.TAAGTGGT\\tSM:NA18945" \
  --in-fq ${SAMPLE_DIR}/NA18945/NA18945_5_1.fastq.gz \
  ${SAMPLE_DIR}/NA18945/NA18945_5_2.fastq.gz \
  "@RG\\tID:NA18945.HFKGLDSXX.2.TAAGTGGT\\tPL:ILLUMINA\\tPU:HFKGLDSXX.2.TAAGTGGT\\tLB:HFKGLDSXX.2.TAAGTGGT\\tSM:NA18945" \
  --in-fq ${SAMPLE_DIR}/NA18945/NA18945_6_1.fastq.gz \
  ${SAMPLE_DIR}/NA18945/NA18945_6_2.fastq.gz \
  "@RG\\tID:NA18945.HFKGLDSXX.3.TAAGTGGT\\tPL:ILLUMINA\\tPU:HFKGLDSXX.3.TAAGTGGT\\tLB:HFKGLDSXX.3.TAAGTGGT\\tSM:NA18945" \
  --in-fq ${SAMPLE_DIR}/NA18945/NA18945_7_1.fastq.gz \
  ${SAMPLE_DIR}/NA18945/NA18945_7_2.fastq.gz \
  "@RG\\tID:NA18945.HFKGLDSXX.4.TAAGTGGT\\tPL:ILLUMINA\\tPU:HFKGLDSXX.4.TAAGTGGT\\tLB:HFKGLDSXX.4.TAAGTGGT\\tSM:NA18945" \
  --in-fq ${SAMPLE_DIR}/NA18945/NA18945_8_1.fastq.gz \
  ${SAMPLE_DIR}/NA18945/NA18945_8_2.fastq.gz \
  "@RG\\tID:NA18945.HFKV5DSXX.1.TAAGTGGT\\tPL:ILLUMINA\\tPU:HFKV5DSXX.1.TAAGTGGT\\tLB:HFKV5DSXX.1.TAAGTGGT\\tSM:NA18945" \
  --in-fq ${SAMPLE_DIR}/NA18945/NA18945_9_1.fastq.gz \
  ${SAMPLE_DIR}/NA18945/NA18945_9_2.fastq.gz \
  "@RG\\tID:NA18945.HFKV5DSXX.2.TAAGTGGT\\tPL:ILLUMINA\\tPU:HFKV5DSXX.2.TAAGTGGT\\tLB:HFKV5DSXX.2.TAAGTGGT\\tSM:NA18945" \
  --in-fq ${SAMPLE_DIR}/NA18945/NA18945_10_1.fastq.gz \
  ${SAMPLE_DIR}/NA18945/NA18945_10_2.fastq.gz \
  "@RG\\tID:NA18945.HFKV5DSXX.3.TAAGTGGT\\tPL:ILLUMINA\\tPU:HFKV5DSXX.3.TAAGTGGT\\tLB:HFKV5DSXX.3.TAAGTGGT\\tSM:NA18945" \
  --in-fq ${SAMPLE_DIR}/NA18945/NA18945_11_1.fastq.gz \
  ${SAMPLE_DIR}/NA18945/NA18945_11_2.fastq.gz \
  "@RG\\tID:NA18945.HFKV5DSXX.4.TAAGTGGT\\tPL:ILLUMINA\\tPU:HFKV5DSXX.4.TAAGTGGT\\tLB:HFKV5DSXX.4.TAAGTGGT\\tSM:NA18945" \
  --bwa-options '-T 0 -Y' \
  --num-gpus $NUM_GPUS \
  --out-bam ${OUTPUT_DIR}/NA18945.cram && \
end_time_fq2bam=$(date +%s) && \
execution_time_fq2bam=$((end_time_fq2bam - start_time_fq2bam)) && \
echo "Execution time for fq2bam: $execution_time_fq2bam seconds" && \

# ②autosome: Start timing
start_time_autosome=$(date +%s) && \
pbrun haplotypecaller --htvc-low-memory \
  --ref ${REF_DIR}/Homo_sapiens_assembly38.fasta \
  --in-bam ${OUTPUT_DIR}/NA18945.cram  \
  --interval-file ${WGSpipeline_DIR}/interval_files/autosome.bed \
  --ploidy 2\
  --num-gpus $NUM_GPUS \
  --out-variants ${OUTPUT_DIR}/NA18945cd.autosome.g.vcf.gz \
  --gvcf && \
end_time_autosome=$(date +%s) && \
execution_time_autosome=$((end_time_autosome - start_time_autosome)) && \
echo "Execution time for autosome: $execution_time_autosome seconds" && \

# ③PAR: Start timing
start_time_PAR=$(date +%s) && \
pbrun haplotypecaller --htvc-low-memory \
  --ref ${REF_DIR}/Homo_sapiens_assembly38.fasta \
  --in-bam ${OUTPUT_DIR}/NA18945.cram  \
  --interval-file ${WGSpipeline_DIR}/interval_files/PAR.bed \
  --ploidy 2\
  --num-gpus $NUM_GPUS \
  --out-variants ${OUTPUT_DIR}/NA18945.PAR.g.vcf.gz \
  --gvcf && \
end_time_PAR=$(date +%s) && \
execution_time_PAR=$((end_time_PAR - start_time_PAR)) && \
echo "Execution time for PAR: $execution_time_PAR seconds" && \

# ④chrX_female: Start timing
start_time_chrX_female=$(date +%s) && \
pbrun haplotypecaller --htvc-low-memory \
  --ref ${REF_DIR}/Homo_sapiens_assembly38.fasta \
  --in-bam ${OUTPUT_DIR}/NA18945.cram  \
  --interval-file ${WGSpipeline_DIR}/interval_files/chrX.bed \
  --ploidy 2\
  --num-gpus $NUM_GPUS \
  --out-variants ${OUTPUT_DIR}/NA18945.chrX_female.g.vcf.gz \
  --gvcf && \
end_time_chrX_female=$(date +%s) && \
execution_time_chrX_female=$((end_time_chrX_female - start_time_chrX_female)) && \
echo "Execution time for chrX_female: $execution_time_chrX_female seconds" && \

# ⑤chrX_male: Start timing
start_time_chrX_male=$(date +%s) && \
pbrun haplotypecaller --htvc-low-memory \
  --ref ${REF_DIR}/Homo_sapiens_assembly38.fasta \
  --in-bam ${OUTPUT_DIR}/NA18945.cram  \
  --interval-file ${WGSpipeline_DIR}/interval_files/chrX.bed \
  --ploidy 1 \
  --num-gpus $NUM_GPUS \
  --out-variants ${OUTPUT_DIR}/NA18945.chrX_male.g.vcf.gz \
  --gvcf && \
end_time_chrX_male=$(date +%s) && \
execution_time_chrX_male=$((end_time_chrX_male - start_time_chrX_male)) && \
echo "Execution time for chrX_male: $execution_time_chrX_male seconds" && \

# ⑥chrY: Start timing
start_time_chrY=$(date +%s) && \
pbrun haplotypecaller --htvc-low-memory \
  --ref ${REF_DIR}/Homo_sapiens_assembly38.fasta \
  --in-bam ${OUTPUT_DIR}/NA18945.cram  \
  --interval-file ${WGSpipeline_DIR}/interval_files/chrY.bed \
  --ploidy 1 \
  --num-gpus $NUM_GPUS \
  --out-variants ${OUTPUT_DIR}/NA18945.chrY.g.vcf.gz \
  --gvcf && \
end_time_chrY=$(date +%s) && \
execution_time_chrY=$((end_time_chrY - start_time_chrY)) && \
echo "Execution time for chrY: $execution_time_chrY seconds" && \

echo "end_date_time : $(date)"
# ALL execution time
execution_time=$((end_time_chrY - start_time_fq2bam))
echo "Execution time for ALL: $execution_time seconds"
echo $execution_time $execution_time_fq2bam $execution_time_autosome $execution_time_PAR $execution_time_chrX_female $execution_time_chrX_male $execution_time_chrY
