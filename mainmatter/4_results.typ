#import "../preamble.typ": *

= Results <results>

== Differentially Expressed Genes in GBM <diff-results>
Presented in @corr-plots are plots plotting the transcriptomic log2FC against proteomic log2FC. 
#figure(
    grid(
        columns: 3,
        row-gutter: 1em,
    )[
        #image("../images/log2fc_corr_classical.png"
        )
    ][
        #image("../images/log2fc_corr_mesenchymal.png")
    ][
        #image("../images/log2fc_corr_proneural.png")
    ],
    kind: image,
    caption:[Log2FC comparison of transcriptome and proteome for classical (left), mesenchymal (middle), proneural (right) subtypes.] 
    ,
) <corr-plots>

For classical, mesenchymal, and proneural subtypes respectively, the calculated squared-Pearson correlation values $R^2$ are $0.436$, $0.472$, and $0.463$. The results line up quite closely with a previous major study conducted by Vogel and Marcotte @vogel2012, stating that only about 40% of the variation of one can be explained by the other.

==  Functional enrichment of differentially expressed genes <gene-ont>


== Association between apoptosis and mitochondrial respiratory complexes <cell-death-int>
