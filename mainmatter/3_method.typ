#import "../preamble.typ": *

= Materials and Methods <methodology>

== Data Source

The transcriptomic data were retrieved from the National Cancer Institute’s publicly available Clinical Proteomic Tumor Analysis Consortium Glioblastoma Multiforme (CPTAC-GBM) cohort through the NCI’s Genomic Data Commons (GDC) Data Portal. The GDC dataset contained RNA-seq data from over 200 GBM samples in the form of raw counts of each gene. CPTAC-GBM Discovery Study metadata were then used to identify the molecular subtypes of the corresponding cases. Among the CPTAC cases, 99 samples with the Proneural, Mesenchymal, and Classical molecular subtypes were identified and used for the transcriptomic analysis @cptac3_gdc @pdc000204. Of the 99 samples, 25 were identified to be of the Classical subtype. 

Additionally, the CPTAC-GBM Discovery Study used 10 normal frontal cortex samples from the Genotype-Tissue Expression (GTEx) project as controls. Of these 10 GTEx controls, transcriptomic data for 7 were accessible and were therefore used as controls in this thesis @pdc000204. The same GTEx controls were selected to maintain consistency with the original CPTAC-GBM study and to facilitate potential future comparisons between transcriptomic and proteomic data. Differences in sequencing depth and library size between the controls and GBM samples will be resolved later in the process with the DEseq2 library. 


== Data quality control and inspection

As suggested by Harvard Chan Bioinformatics Core @hbctraining_qc, with raw gene counts, a number of plots can be done to inspect the general landscape of the data and its quality, mainly through hierarchical clustering methods and Principal Component Analysis (PCA) of the log2-transform of the count data. Because transcriptomic expression values typically span several orders of magnitude and exhibit right-skewed distributions, log2-transform improves clustering for visualization @cox2014 @law2014 @hbctraining_qc. 

#figure(
    grid(
        columns: 2,
        row-gutter: 1em,
    )[
        #image("../images/QC/corrheatmap_classical.png"
        )
    ][
        #image("../images/QC/PCA.png")
    ],
    kind: image,
    caption:[Hierarchical Clustering Heatmap (left), PCA (right)] 
    ,
) <classical-corr-heat-pca>

The hierarchical clustering heatmap (shown in @classical-corr-heat-pca) groups samples according to their similarity based on the samples' gene expression Pearson correlation. Samples with similar biological characteristics are expected to exhibit similar expression profiles and therefore cluster together @hbctraining_qc. In the current dataset, most Classical GBM samples form a distinct cluster from the control samples. However, three samples cluster more closely with the controls than with the other GBM samples. To determine whether these samples represent potential outliers or reflect biological variation, PCA was performed.

As noted by the Harvard Chan Bioinformatics Core @hbctraining_qc, biological replicates are expected to have similar expression profiles and cluster together in PCA. The PCA shown in @classical-corr-heat-pca demonstrates clear separation between Classical GBM and control samples, with no apparent sample-level outliers. Thus, although three samples show higher similarity to the controls in the hierarchical clustering analysis, their position in the PCA does not indicate clear evidence of them being outliers.

== Differential expression analysis

@hbctraining_deseq2
In the CPTAC Discovery Study, healthy brain tissue samples are provided as the
baseline for comparison for the remaining tumor samples. Comparing the gene expressions of the tumors against healthy samples can give insights 
(or, at least, a base for further comparative computations) into what is different.

The samples were split into three major subtypes according to the metadata: classical, proneural, mesenchymal. For each subtype, the $log_2$-fold-change (log2FC) for a specific gene is the difference between the mean expression of a gene in the subtype and the mean expression of the same gene in the control:

$
  log_2 F C = sum("expression in subtype")/n_"subtype" - sum("expression in control")/n_"control"
  
$



At the same time, the Welch's t-test for independence is applied to obtain the statistical significance of the difference between the expression of the tumors and healthy samples for a specific gene in the form of the obtained p-value @kim2019. The Welch's t-test was chosen over the standard Student's t-test due to the high chance of the variances to be different @kim2019. The analysis was implemented in Python using SciPy's `ttest_ind` function with `equal_var=False`.

To account for inflated false-positive count resulting from multiple testings, the p-values are corrected with the Benjamini-Hochberg method for False Discovery Rate (FDR) @jafari2019. This is achieved in Python with the `statsmodels` library using the `multipletests` function and `method=fdr_bh` parameter.

With the obtained p-value and log2FC obtained for each gene, the genes are classified whether they are considered statistically and quantitatively significant with a chosen threshold for p-value and absolute value of log2FC, which are $0.05$ and $1$ respectively for this thesis. Consequently, genes with $p"-value" < 0.05$ and $log_2 F C > 1$ are categorized as "Significantly Upregulated", and genes with $p"-value" < 0.05$ and $log_2 F C < -1$ are "Significantly Downregulated". From this point onwards, the categories are simply referred to as "upregulated" and "downregulated".

This step concludes the preparation for a "solid base" of results for further comparative computations, which should include: (1) gene name and its corresponding (2) transcriptome log2FC, (3) transcriptome adjusted p-value, (4) proteome log2FC, (5) proteome adjusted p-value.





With the results, we can plot a variety of plots to give insight into the overall structure of the expressions.
For instance, the volcano plot: log2FC for the x-axis, $-log_10(p"-value")$ for the y-axis.
Additionally, the thresholds can be added to the plot to show the categorically significant portion of the distribution. For example, the volcano plots for the expression values of both transcriptome and proteome for the proneural subtype are shown side-by-side in @example-volcano.

#figure(
    grid(
        columns: 2,
        row-gutter: 1em,
    )[
        #image("../images/proneural_volcano_rna.png"
        )
    ][
        #image("../images/proneural_volcano_pro.png")
    ],
    kind: image,
    caption:[Example volcano plots. Left: Proneural Transcriptome. Right: Proneural Proteome.] 
    ,
) <example-volcano>

Another possible plot to see the structure of the data include plotting log2FC of the transcriptome against that of the proteome, with this we can calculate the correlation between the two. Additionally, the distribution of log2FC values can be inspected in a density plot. Example for both, produced from the processed CPTAC expression data, are shown in @example-log2fc-plots.



#figure(
    grid(
        columns: 2,
        row-gutter: 1em,
    )[
        #image("../images/log2fc_corr_proneural.png"
        )
    ][
        #image("../images/log2fc_density.png")
    ],
    kind: image,
    caption:[Example log2FC comparison plots. Left: Transcriptomic Log2FC plotted against proteomic Log2FC. Right: Distribution of transcriptomic and proteomic Log2FC.] 
    ,
) <example-log2fc-plots>

Because the result of these calculations are _particularly important_ because all other analyses onwards rely on it, the computed correlations between the two log2FC's for each subtype are shown and discussed regarding reliability in section @explore-plot-result.

== Gene Ontology enrichment analysis

From the set of significant genes for individual subtypes, 
gene set enrichment analysis was applied to identify significant changes in cellular aspects
that would otherwise go unnoticed if examination was done on an individual gene basis @joly2021. This was achieved by using the `GSEApy` library, and using the library's predefined gene set Gene Ontology (GO) libraries `GO_Biological_Process_2023`,`GO_Cellular_Component_2023`, and `GO_Molecular_Function_2023` to identify biological processes, cellular components, and molecular functions significantly affected by the genes. One can choose the gene set fed into `GSEApy` to include only upregulated genes, downregulated genes, or both. For explatory purposes, all three options can be done. For this thesis, however, including both was chosen to capture as much of the underlying interactions as possible for further analysis. Results are presented in section @gene-ont.

== STRING Interaction Network Analysis

== Statistical Analysis