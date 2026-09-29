#import "../preamble.typ": *

= MATERIALS AND METHODOLOGY <methodology>

== Data source <data-source>

The transcriptomic data were retrieved from the publicly available Clinical Proteomic Tumor Analysis Consortium Glioblastoma Multiforme (CPTAC-GBM) cohort through the National Cancer Institute's Genomic Data Commons (GDC) Data Portal. The GDC dataset contained RNA-seq data from over 200 GBM samples in the form of raw counts of each gene. CPTAC-GBM Discovery Study metadata were then used to identify the molecular subtypes of the corresponding cases. Among the CPTAC cases, 99 samples with the Proneural, Mesenchymal, and Classical molecular subtypes were identified and used for the transcriptomic analysis @cptac3_gdc @pdc000204. Of the 99 samples, 25 were identified to be of the Classical subtype.

Although CPTAC provides RNA-seq data for "healthy" samples, the samples are Normal Adjacent Tissue (NAT) which are brain tissues that have yet to exhibit cancerous features nearby the extracted tumors @cptac3_gdc @liu2024_cptac_codex. Aran et al.  showed NAT samples specifically from CPTAC's cancer samples have substantial transcriptomic and epigenetic alterations, causing them to be in a molecular "unique intermediate state" between healthy and tumor, despite not yet exhibiting cancerous features @aran2017. Therefore, NAT samples provided by CPTAC were considered unsuitable as a baseline for comparison in this thesis. In its place, the Genotype-Tissue Expression (GTEx) project provides comprehensive, and peer-reviewed RNA-seq data from healthy brain tissue, suitable for comparison in cancer research @gtex2020 @zeng2019.

The CPTAC-GBM Discovery Study used 10 normal frontal cortex samples from GTEx as controls  @pdc000204. Of these 10 GTEx controls, transcriptomic data for 7 were accessible and were therefore used as controls in this thesis. The same GTEx controls were selected to maintain consistency with the original CPTAC-GBM study and to facilitate potential future comparisons between transcriptomic and proteomic data. 


== Data quality control and inspection

As suggested by the Harvard Chan Bioinformatics Core, with raw gene counts, a number of unsupervised explatory data analysis methods can be used to inspect the general landscape of the data and assess its quality, mainly through hierarchical clustering methods and Principal Component Analysis (PCA) of log2-transformed count data. Because transcriptomic expression values can span several orders of magnitude, log2-transformation compresses the range of expression values and reduces the influence of highly expressed genes, thereby improving the suitability of the data for clustering and visualization @cox2014 @law2014 @hbctraining_qc.

#figure(
  grid(
    columns: 2,
    gutter: 1.5em, // Replaced row-gutter with general gutter for clean spacing
    stack(
      dir: ttb,
      spacing: 0.5em,
      align(left)[*A*],
      image("../images/QC/corrheatmap_classical.png", width: 100%)
    ),
    stack(
      dir: ttb,
      spacing: 0.5em,
      align(left)[*B*],
      image("../images/QC/PCA.png", width: 100%)
    )
  ),
  kind: image,
  caption: [Data Quality Control Analyses. *(A)* Hierarchical clustering heatmap of sample-to-sample correlations, demonstrating group-wise similarities. *(B)* Principal Component Analysis (PCA) plot showing the global variance and distinct separation between sample cohorts.]
) <classical-corr-heat-pca>


The hierarchical clustering heatmap (shown in @classical-corr-heat-pca) groups samples according to their similarity based on the samples' gene expression Pearson correlation. Samples with similar biological characteristics are expected to exhibit similar expression profiles and therefore cluster together @hbctraining_qc. In the current dataset, most Classical GBM samples form a distinct cluster from the control samples. However, three samples cluster more closely with the controls than with the other GBM samples. To determine whether these samples represent potential outliers or reflect biological variation, PCA is a complementary quality control plot used for further data quality confirmation.

As noted by the Harvard Chan Bioinformatics Core @hbctraining_qc, biological replicates are expected to have similar expression profiles and cluster together in PCA. The PCA (also shown in @classical-corr-heat-pca) demonstrates clear separation between Classical GBM and control samples, with no apparent sample-level outliers. Thus, although three samples show higher similarity to the controls in the hierarchical clustering analysis, their position in the PCA does not indicate clear evidence of them being outliers.



#figure(
  grid(
    columns: 2,
    gutter: 1.5em,
    stack(
      dir: ttb,
      spacing: 0.5em,
      align(left)[*A*],
      image("../images/QC/exprscatter.png", height: 6cm)
    ),
    stack(
      dir: ttb,
      spacing: 0.5em,
      align(left)[*B*],
      image("../images/QC/density.png", height: 6cm)
    )
  ),
  kind: image,
  caption: [Comparative Gene Expression and Variance Distributions. *(A)* Scatter plot of gene expression magnitudes comparing Classical GBM against GTEx control samples. *(B)* Frequency histograms showing the distribution profiles of the top 10.000 genes exhibiting the largest absolute differences in expression.]
) <expr-compare>


@expr-compare presents an initial exploration of the baseline expression levels across the two cohorts. The scatter plot reveals a subset of genes exhibiting high expression values in the GBM samples relative to the GTEx controls. This is further confirmed by the expression histogram of the 10.000 genes of 45.000 with the largest differences between the GBM samples and controls, where expressions in GBM is generally shifted upward compared to the control. This further validates the need for further investigation into the differences between the two.

== Differential expression analysis

The raw count data from the 25 Classical GBM samples and 7 GTEx control samples were used as input to PyDESeq2 to obtain the $log_2"FC"$ values and their corresponding adjusted $p$-values.
Volcano plots were used to display the distribution of differentially expressed genes (DEGs). DEGs $abs(log_2"FC") > 1$ and $  p < 0.05$ were considered significantly differentially expressed. For further detail, significant DEGs with $log_2"FC" > 1$ were lablled as "up-regulated", and $log_2"FC"<1$ as "down-regulated". These thresholds were selected to identify genes showing both a minimum two-fold change in expression and statistically significant differential expression.
The volcano plot along with the count of significant DEGs are presented in Section @diff-results.

== GO functional enrichment 

GO enrichment analysis was performed on the set of significant differentially expressed genes (DEGs) to identify overrepresented Biological Process (BP) terms. The analysis was performed using the GSEApy Python library with the predefined `GO_Biological_Process_2023` gene-set library. The significant DEGs identified from the differential expression analysis were used as the input gene set. The resulting enrichment terms were ranked according to their statistical significance and the number of genes involved each of the enriched term, and displayed in a dot plot. The results are presented in Section @gene-ont.

The top enriched biological processes were subsequently examined to identify processes relevant to the objectives of this study. Based on the enrichment results and discussed biological connection in Section @mito-apop-connect, apoptosis and mitochondrial respiratory-chain complexes were selected for further analysis. 

== STRING interaction network mapping and analysis

The list of genes associated with apoptosis was retrieved from the Kyoto Encyclopedia of Genes and Genomes (KEGG) database, via GSEApy using the `KEGG_2021_Human` gene-set library @kegg. 
The list of genes complexes I–V was retrieved from Human Mitocarta which provides information on mitochondrial genes such as their pathways and tissues in which they are involved @mitocarta3_human. DEGs belonging to either the apoptosis gene set or the mitochondrial respiratory-complex gene sets were combined into a single gene set for further analysis. As an additional visualization, log2FC of the genes in the set were plotted in a bar graph to inspect the portion of up and down-regulated genes in each of the biological entities involved.

The selected genes are then fed into to the STRING database to obtain protein association networks, limiting the confidence score of interaction to at least 0.90 to see the most meaningful interactions. The resulting networks were imported into Python and analysed using the NetworkX library. 

Associations between apoptosis-associated proteins and proteins belonging to each mitochondrial respiratory-chain complex were identified by counting the corresponding network edges and identifying the proteins involved. The resulting edge counts and protein involvement were used to characterize the associations between apoptosis and complexes I–V. The corresponding results are presented in Section @cell-death-int.

== Statistical analysis

The differential expression analysis was performed with PyDESeq2. The $log_2"FC"$ values were modelled with a negative binomial generalized linear model, and the corresponding $p$-values are determined using Wald tests. The $p$-values were further corrected with Benjamini-Hochberg method to account for inflated false discovery rate due to multiple testing @deseq2_bioc_vignette @pydeseq2_docs. $"Log"_2"FC" >1$ with $p < 0.05$ were considered significant.

The $p$-values for GO Enrichment were determined using one-sided Fisher's exact test, and also corrected using Benjamini-Hochberg method for multiple testing; $p < 0.05$ were considered significant @scbestpractices_gsea. The STRING confidence scores are based on the database's own probabilistic framework. A closer score to 1 indicates higher confidence that the interaction is real @string_scores.