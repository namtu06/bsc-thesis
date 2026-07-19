#import "../preamble.typ": *

= Results and Discussion <results-discussion>

== Differential Analysis Correlation Results <explore-plot-result>
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

== Gene Ontology Enrichment <gene-ont>
The results for GO Enrichment for the set of significantly expressed genes are presented in @subtype-go. More specifically, the top 10 for each of the aspect biological processes, cellular components, molecular functions and their corresponding $-log_10(p"-value")$ are displayed. The larger $-log_10(p"-value")$ is for a particular BP, CC, or MF, the more significantly it is altered in the particular diseased state than compared to the healthy sample.

#figure(
    grid(
        columns: 3,
        row-gutter: 1em,
    )[
        #image("../images/results/GO_classical.png"
        )
    ][
        #image("../images/results/GO_mesenchymal.png")
    ][
        #image("../images/results/GO_proneural.png")
    ],
    kind: image,
    caption:[GO Enrichment of Biological Processes (BP), Cellular Components (CC), and Molecular Functions (MF) of significant genes for each subtype.] 
    ,
) <subtype-go>

It should be noted before further discussion that GO Enrichment only displays BP, CC, MF _most altered compared to the healthy state_, and may not be representative of _subtype-specific biological behaviors_ as assigned in past studies. *The two may not necessarily be correlated*, because they are fundamentally different objectives @fabris2020. Still, it is worth to comparing and contrasting the two to observe any interesting findings. 


Across all three subtypes, they share common top enriched biological processes such as "Axonogenesis", "Modulation of Chemical Synaptic Transmission", and "Chemical Synaptic Transmission", which are all neuron-centric biological processes.
Compared with past studies discussing subtype-specific biology @verhaak2010 @aguardia2020 @gill2014, the results for each subtype are as follow:
1. *Classical*: The subtype mainly exhibits proliferation and EGFR signaling increase. However, similarly with other subtypes, GO Enrichment indicated that the most affected processes are mostly neural-related. Identified biological processes related to the classical subtypes in the GO Enrichment tend range from 11th to 803th place (which are not shown in the plot).
2. *Mesenchymal*: This subtype biologically displays a particular increase in immune and inflammatory processes, even in Gene Set Enrichment Analysis (GSEA). However, in the GO Enrichment — the result of this thesis's analysis — top 10 altered biological processes are all very neuron-centric. Mesenchymal-related biological processes from the GO Enrichment lie from 22nd to 689th place. 
3. *Proneural*: The top significantly affected processes line up closely with their biological behavior, most of which are neuron-related and neural development-related. The GO terms range from 1st to 728th place.

The identification of biological processes for each subtype was done using a predefined list of keywords. Both the list of inputting keywords and GO terms output are presented in @subtype-deep-go.

== Cell Death Pathway Integration <cell-death-int>