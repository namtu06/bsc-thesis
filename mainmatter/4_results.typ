#import "../preamble.typ": *

= Results and Discussion <results-discussion>


== Gene Ontology Enrichment <gene-ont>
The results for GO Enrichment for the set of significantly expressed genes are presented in @subtype-go.
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

== Cell death pathway intergration <cell-death-intergration>