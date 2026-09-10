#import "../preamble.typ": *

= Results <results>

== Differentially Expressed Genes in GBM <diff-results>

Displayed in @volcano is the volcano generated from the differential analysis results performed with PyDESeq2, with $log_2"FC"$ on the x-axis and its $-log_10("adjusted" p"-value")$ on the y-axis for a single gene. The plot shows a large portion of the genes in the GBM samples are 
significantly differentially expressed, and the change in expression and their statistical significance vary heavily. Absolute values $log_2"FC"$ can vary up to 15, and $-log_10("adjusted "p"-value")$ can reach as high as over 300, corresponding to an $"adjusted "p"-value"$ of $ 10^(-300)$.
#figure(
    grid(
        columns: 1,
        row-gutter: 1em,
    )[
        #image("../images/results/volcano.png", height: 10cm,
        )
    ],
    kind: image,
    caption:[Classical GBM vs GTEx Control Volcano Plot] 
    ,
) <volcano>

Of the 45.000 results produced by PyDESeq2, roughly 27.300 genes were identified to be significantly differentially expressed — around 60%. More specifically, 20.300 of the 27.300 were up-regulated with mean $log_2"FC"$ of $3.98$, and the remaining 7.000 genes were down-regulated with mean $log_2"FC"$ of $-2.71$.


==  Functional enrichment of differentially expressed genes <gene-ont>
With the set of significant DEGs obtained from the differential analysis, they are enriched with GO to identify overrepressented biological processes in the GBM samples. The results of the enrichment are displayed as a dot plot in @goenrichment where the top 20 overrepresented GO Biological terms are presented along with their statistical significance and the count of their representing genes.

#figure(
    grid(
        columns: 1,
        row-gutter: 1em,
    )[
        #image("../images/results/goenrichment.png", height: 14cm,
        )
    ],
    kind: image,
    caption:[GO Enrichment dot plot] 
    ,
) <goenrichment>

Of the top 20 overrepresented BPs in terms of gene counts, 9 were identified to be be related to the respitatory functions of the mitochondria (highlighted in red) as discussed in @respitatory-funcs, all with a corresponding $p"-value"$ lower than $0.05$. Furthermore, the majority (7 out of 9) of identified mitochondrial respiration-related BPs lie within the top 10 overrepresented BPs.

== Association between apoptosis and mitochondrial respiratory complexes <cell-death-int>
