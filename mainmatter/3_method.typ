#import "../preamble.typ": *

= Materials and Methods <methodology>

== Data Source

The transcriptomic data were retrieved from the National Cancer Institute’s publicly available Clinical Proteomic Tumor Analysis Consortium Glioblastoma Multiforme (CPTAC-GBM) cohort through the NCI’s Genomic Data Commons (GDC) Data Portal. The GDC dataset contained RNA-seq data from over 200 GBM samples in the form of raw counts of each gene. CPTAC-GBM Discovery Study metadata were then used to identify the molecular subtypes of the corresponding cases. Among the CPTAC cases, 99 samples with the Proneural, Mesenchymal, and Classical molecular subtypes were identified and used for the transcriptomic analysis @cptac3_gdc @pdc000204. Of the 99 samples, 25 were identified to be of the Classical subtype.

Additionally, the CPTAC-GBM Discovery Study used 10 normal frontal cortex samples from the Genotype-Tissue Expression (GTEx) project as controls. Of these 10 GTEx controls, transcriptomic data for 7 were accessible and were therefore used as controls in this thesis @pdc000204. The same GTEx controls were selected to maintain consistency with the original CPTAC-GBM study and to facilitate potential future comparisons between transcriptomic and proteomic data. Differences in sequencing depth and library size between samples were accounted for through the size-factor normalization performed by PyDESeq2 during differential expression analysis @deseq2_bioc_vignette @pydeseq2_docs.


== Data quality control and inspection

As suggested by the Harvard Chan Bioinformatics Core @hbctraining_qc, with raw gene counts, a number of plots can be used to inspect the general landscape of the data and assess its quality, mainly through hierarchical clustering methods and Principal Component Analysis (PCA) of log2-transformed count data. Because transcriptomic expression values can span several orders of magnitude, log2 transformation compresses the range of expression values and reduces the influence of highly expressed genes, thereby improving the suitability of the data for clustering and visualization @cox2014 @law2014 @hbctraining_qc.

#figure(
    grid(
        columns: 2,
        row-gutter: 1em,
    )[
        #image("../images/QC/corrheatmap_classical.png", height: 6cm,
        )
    ][
        #image("../images/QC/PCA.png", height: 6cm)
    ],
    kind: image,
    caption:[Hierarchical Clustering Heatmap (left), PCA (right)] 
    ,
) <classical-corr-heat-pca>

The hierarchical clustering heatmap (shown in @classical-corr-heat-pca) groups samples according to their similarity based on the samples' gene expression Pearson correlation. Samples with similar biological characteristics are expected to exhibit similar expression profiles and therefore cluster together @hbctraining_qc. In the current dataset, most Classical GBM samples form a distinct cluster from the control samples. However, three samples cluster more closely with the controls than with the other GBM samples. To determine whether these samples represent potential outliers or reflect biological variation, PCA is a complementary quality control plot used for further data quality confirmation.

As noted by the Harvard Chan Bioinformatics Core @hbctraining_qc, biological replicates are expected to have similar expression profiles and cluster together in PCA. The PCA (also shown in @classical-corr-heat-pca) demonstrates clear separation between Classical GBM and control samples, with no apparent sample-level outliers. Thus, although three samples show higher similarity to the controls in the hierarchical clustering analysis, their position in the PCA does not indicate clear evidence of them being outliers.

== Differential expression analysis

The raw count data from the 25 Classical GBM samples and 7 GTEx control samples were used as input to the PyDESeq2 model. PyDESeq2 performed differential expression analysis and generated the corresponding log2FC, standard error, test statistic, p-value, and adjusted p-value for each gene. PyDESeq2 models RNA-seq count data using a negative binomial generalized linear model and assesses the statistical significance of the estimated coefficients using Wald tests @deseq2_bioc_vignette @pydeseq2_docs.

With the log2FCs and their adjusted p-values, volcano plots were used to display the distribution of differentially expressed genes (DEGs). DEGs $abs(log_2"FC") > 1$ and $ "adjusted" p"-value" < 0.05$ were considered significantly differentially expressed. These thresholds were selected to identify genes showing both a minimum two-fold change in expression and statistically significant differential expression. The volcano plot along with the count of significant DEGs are presented in @diff-results.

== GO enrichment and STRING Interaction Network Analysis

GO enrichment analysis was performed on the set of significant differentially expressed genes (DEGs) to identify overrepresented Biological Process (BP) terms. The analysis was performed using the GSEApy Python library with the predefined `GO_Biological_Process_2023` gene-set library. The significant DEGs identified from the differential expression analysis were used as the input gene set. The resulting enrichment terms were ranked according to their statistical significance and the number of genes involved each of the enriched term, and displayed in a dot plot. The results are presented in @gene-ont.

The top enriched biological processes were subsequently examined to identify processes relevant to the objectives of this study. Based on the enrichment results and discussed biological connection in @mito-apop-connect, apoptosis and mitochondrial respiratory-chain complexes were selected for further analysis. 

The list of genes associated with apoptosis was retrieved from the Kyoto Encyclopedia of Genes and Genomes (KEGG) database, via GSEApy using the `KEGG_2021_Human` gene-set library @kegg. 
The list of genes complexes I–V was retrieved from Human Mitocarta @mitocarta3_human. DEGs belonging to either the apoptosis gene set or the mitochondrial respiratory-complex gene sets were combined into a single gene set for further analysis.
 
The selected genes are then fed into to the STRING database to obtain protein association networks. The resulting networks were imported into Python and analysed using the NetworkX library. Associations between apoptosis-associated proteins and proteins belonging to each mitochondrial respiratory-chain complex were identified by counting the corresponding network edges. The resulting edge counts were used to characterize the associations between apoptosis and complexes I–V.


