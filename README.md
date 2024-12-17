# ScRNA-Preprocessing
This repository contains scripts and tools for single-cell RNA sequencing (scRNA-seq) data analysis using Cell Ranger, including preprocessing, demultiplexing and alignment. It aims to streamline the processing workflow, enabling efficient analysis of single-cell transcriptomic data. 

# Code functionalities
__rename_fastq__ : the script helps in organizing sequencing data files by standardizing their names based on specific criteria.  

__cellranger_demultiplexing__ : the script separates pooled single-cell RNA sequencing reads based on unique barcodes, enabling accurate identification and quantification of gene expression in individual cells.  

__cellranger_count__ : the script processes demultiplexed single-cell RNA sequencing data to produce gene expression matrices.  

__velocity_10X__ :  the script quantifies spliced and unspliced mRNA in single-cell RNA-seq data, facilitating RNA velocity analysis and insights into cellular dynamics and gene expression changes over time.

# Downloading
```bash
git clone https://github.com/Nagooz/ScRNA-Preprocessing.git
cd ScRNA-Preprocessing
