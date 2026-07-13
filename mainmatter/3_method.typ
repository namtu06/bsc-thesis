#import "../preamble.typ": *

= Research methodology <methodology>
== Data retrieval and preparation
Both transcriptome and proteome data was obtained from CPTAC GBM Discovery Study dataset, given as already-cleaned-and-normalized (but not yet $log_2$-transformed) expression values according to their originating gene. The steps for this section are repeated twice: once for the transcriptome data, another for the proteome data.

Transcriptomic and proteomic expression values typically span several orders of magnitude and exhibit right-skewed distributions @law2014.
Therefore, a common practice when working with expression matrices, which has been done to the current data, is to apply a $log_2$-transformation to each of the value @law2014 @cox2014. 
An example expression value matrix ready for calculation is given in @example-expression-matrix.

#show table.cell.where(y: 0): strong
#figure(
    table(
        columns: 5,
        stroke: none,
        align: center + horizon,
        table.header([Gene],table.vline(),[Sample 1],table.vline(),[Sample 2],table.vline(),[Sample 3],table.vline(),[...]),
        table.hline(),
        [A1BG], num(18.833), num(18.647),num(18.958),[...],
        [SPC25], num(13.475), num(13.469),num(13.786),[...],
        [...],[...],[...],[...],[...]
    ),
    caption: [Example expression matrix]
) <example-expression-matrix>
== Performing differential analysis

In the CPTAC Discovery Study, healthy brain tissue samples are provided as the
baseline for comparison for the remaining tumor samples. As described in @multiomics,
comparing the gene expressions of the tumors against healthy samples can give insights 
(or, at least, a base for further comparative computations) into what is different.

From the metadata, the samples are split into the major subtypes: classical, proneural, mesenchymal. For each subtype, the $log_2$-fold-change (log2FC) for a specific gene becomes:

$
  log_2 F C = sum("expression in subtype")/n_"subtype" - sum("expression in healthy sample")/n_"healthy"
  
$

which means the difference between the average expression of a gene in the subtype and the average expression of the same gene in the healthy samples.

At the same time, the Welch's t-test for independence can also be applied to obtain the statistical significance of the difference between the expression of the tumors and healthy samples for a specific gene in the form of the obtained p-value @kim2019. The Welch's t-test was chosen over the standard Student's t-test due to the high chance of the variances to be different @kim2019. Using the `scipy` library for Python, this can be easily automated for the entire dataset with the `ttest_ind` function with the `equal_var=False` parameter.

To account for inflated false positive count resulting from multiple testings, the p-values are corrected with the Benjamini-Hochberg method for False Discovery Rate (FDR) @jafari2019. This can also be achieved in Python with the `statsmodels` library using the `multipletests` function and `method=fdr_bh` parameter.

With the obtained p-value and log2FC obtained for each gene, the genes can be classified whether they are considered "Significant" with a chosen threshold for p-value and absolute value of log2FC, which are $0.05$ and $1$ respectively for this thesis. Consequently, genes with $p"-value" < 0.05$ and $log_2 F C > 1$ are categorized as "Significantly Upregulated", and genes with $p"-value" < 0.05$ and $log_2 F C < -1$ are "Significantly Downregulated". From this point onwards, the categories are simply referred as "upregulated" and "downregulated".

This step concludes the preparation for a "solid base" of results for further comparative computations, which should include: (1) gene name and its corresponding (2) transcriptome log2FC, (3) transcriptome adjusted p-value, (4) proteome log2FC, (5) proteome adjusted p-value.