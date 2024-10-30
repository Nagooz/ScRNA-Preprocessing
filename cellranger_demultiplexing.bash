#!/bin/sh
#
# =============================================================================
# Job Script
# =============================================================================

#SBATCH -J Demultiplexage
#SBATCH --export=ALL
#SBATCH --nodes=1 --ntasks-per-node=8
#SBATCH --no-requeue
#SBATCH --mem=64G
#SBATCH -o serial_test_%j.log
#SBATCH -t 06:00:00
#SBATCH --mail-user=mx.lab@hotmail.fr
#SBATCH --mail-type=ALL

# Check if the correct number of arguments is provided
if [ "$#" -lt 3 ]; then
    echo "Usage: $0 <run_id> <bcl_path> <csv_path>"
    echo "Example: $0 sample_seq /path/to/bcl /path/to/csv"
    exit 1
fi

# Parameters
RUN_ID=$1
BCL_PATH=$2
CSV_PATH=$3

# Load module
module load bioinfo/bcl2fastq/2.20.0

# Execute demultiplexing
cellranger mkfastq --id=${RUN_ID} \
             --run=${BCL_PATH}  \
             --csv=${CSV_PATH}

# Check if the command executed successfully
if [ $? -ne 0 ]; then
    echo "Error: cellranger mkfastq failed."
    exit 1
fi

echo "Demultiplexing completed successfully."