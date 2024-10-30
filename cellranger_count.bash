#!/bin/bash
#
#===================================================================
# Job Script
#===================================================================

#SBATCH -J Alignement_SCAT
#SBATCH --export=ALL
#SBATCH --ntasks=1 --cpus-per-task=16
#SBATCH --no-requeue
#SBATCH --mem=128G
#SBATCH -o serial_test_%j.log
#SBATCH -t 06:00:00
#SBATCH --mail-user=mx.lab@hotmail.fr
#SBATCH --mail-type=ALL

# Check if the correct number of arguments is provided
if [ "$#" -lt 2 ]; then
    echo "Usage: $0 <run_id> <fastq_paths>"
    echo "Example: $0 run_count_sample '/path/to/fastq1,/path/to/fastq2'"
    exit 1
fi

# Parameters
RUN_ID=$1
FASTQ_PATHS=$2

# Start time measurement
START_TIME=$(date +%s)

# Load the Cell Ranger module
module load cellranger/7.0.1

# Command to submit
cellranger count --id=${RUN_ID} \
    --fastqs=${FASTQ_PATHS} \
    --transcriptome=/home/mlabrosse/save/mlabrosse_THESE/refdata-gex-mm10-2020-A \
    --include-introns=false \
    --jobmode=local \
    --localcores=16 \
    --localmem=115

# End time measurement
END_TIME=$(date +%s)

# Calculate the elapsed time
ELAPSED_TIME=$(( END_TIME - START_TIME ))

# Convert elapsed time to hours, minutes, and seconds
HOURS=$(( ELAPSED_TIME / 3600 ))
MINUTES=$(( (ELAPSED_TIME % 3600) / 60 ))

# Print the elapsed time
echo "Elapsed time: ${HOURS} h ${MINUTES} min"