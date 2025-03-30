# ScRNA-Preprocessing
This repository contains scripts and tools for single-cell RNA sequencing (scRNA-seq) data analysis using Cell Ranger, including preprocessing, demultiplexing and alignment. It aims to streamline the processing workflow, enabling efficient analysis of single-cell transcriptomic data. 

# Code functionalities
`rename_fastq.bash` : the script helps in organizing sequencing data files by standardizing their names based on specific criteria.  

`cellranger_demultiplexing.bash` : the script separates pooled single-cell RNA sequencing reads based on unique barcodes, enabling accurate identification and quantification of gene expression in individual cells.  

`cellranger_count.bash` : the script processes demultiplexed single-cell RNA sequencing data to produce gene expression matrices.  

`velocity_10X.bash` :  the script quantifies spliced and unspliced mRNA in single-cell RNA-seq data, facilitating RNA velocity analysis and insights into cellular dynamics and gene expression changes over time.

# Downloading
```bash
git clone https://github.com/Nagooz/ScRNA-Preprocessing.git
cd ScRNA-Preprocessing
