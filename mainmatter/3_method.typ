#import "../preamble.typ": *

= Materials and Methods <methodology>
== Data retrieval and preprocessing
Both transcriptome and proteome data was obtained from CPTAC GBM Discovery Study dataset, given as already-cleaned-and-normalized (but not yet $log_2$-transformed) expression values according to their originating gene. The steps for this section were performed twice: once for the transcriptome data, another for the proteome data.

Transcriptomic and proteomic expression values typically span several orders of magnitude and exhibit right-skewed distributions @law2014.
Therefore, a common practice when working with expression matrices, which has been done to the current data, is to apply a $log_2$-transformation to each of the value @law2014 @cox2014. 
An example expression value matrix ready for calculation is given in @example-expression-matrix.
From this point onwards, "$log_2$ expression" is now referred to as "expression".
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



== Differential expression analysis


In the CPTAC Discovery Study, healthy brain tissue samples are provided as the
baseline for comparison for the remaining tumor samples. Comparing the gene expressions of the tumors against healthy samples can give insights 
(or, at least, a base for further comparative computations) into what is different.

The samples were split into three major subtypes according to the metadata: classical, proneural, mesenchymal. For each subtype, the $log_2$-fold-change (log2FC) for a specific gene becomes:

$
  log_2 F C = sum("expression in subtype")/n_"subtype" - sum("expression in healthy sample")/n_"healthy"
  
$

which means the difference between the average expression of a gene in the subtype and the average expression of the same gene in the healthy samples.

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

== Identification of apoptosis and mitochondrial complex-associated genes

== STRING Interaction Network Analysis

== Statistical Analysis