#!/bin/sh
#
# =============================================================================
# Job Script
# =============================================================================

#SBATCH -J scVelo
#SBATCH --export=ALL
#SBATCH --nodes=1 --ntasks-per-node=8
#SBATCH --no-requeue
#SBATCH --mem=128G
#SBATCH -o serial_test_%j.log
#SBATCH -t 04:00:00
#SBATCH --mail-user=mx.lab@hotmail.fr
#SBATCH --mail-type=ALL

# Check if the correct number of arguments is provided
if [ "$#" -lt 1 ]; then
    echo "Usage: $0 <processed_data_path>"
    echo "Example: $0 '/path/to/fastq1'"
    exit 1
fi

# Parameters
PROCESSED_DATA_PATH=$1


#commande à soumettre
velocyto run10x ${PROCESSED_DATA_PATH} /home/mlabrosse/work/mlabrosse/Velocity/customref-gex-mm10-2020-A/genes/genes.gtf
