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

@fcs shows the Log2FC magnitudes of the genes involved in respiratory complexes and in apoptosis. Proportion-wise, all the complexes are seen to be mostly down-regulated, while apoptosis is split down the middle between up- and down-regulated.

#figure(
    grid(
        columns: 2,
        row-gutter: 1em,
    )[
        #image("../images/results/classical_mitochondrial_complexes_log2fc.svg", height:3cm,
        )
    ][
        #image("../images/results/classical_apoptosis_log2fc.svg", height: 3cm,
        )
    ],
    kind: image,
    caption:[Log2FC bar plot of genes in respiratory complexes (left), and in apoptosis (right).] 
    ,
) <fcs>

Displayed in @general-network is the obtained interaction network containing proteins resulting from apoptotic and respiratory complex genes. Additionally, the protein's involvement is annotated by the color it is filled.

#figure(
    grid(
        columns: 1,
        row-gutter: 1em,
    )[
        #image("../images/results/allnetwork.svg", height: 11cm,
        )
    ],
    kind: image,
    caption:[Protein interaction network from apoptotic and respiratory complex genes in classical GBM.] 
    ,
) <general-network>

The 2 major groups can be seen to be very distinct from one another, and connect with each other through a single apoptotic protein that is CYCS. The STRING combined score of the interactions present start from at least 0.90 to as high as 0.999, with many of the interactions connected to CYCS lie in the higher end of the range. The combination of stated information implies that the gene resulting in CYCS plays a major role in mediating the interaction between the 2 groups. 

For further inspection, the interactions between apoptosis and each of the respiratory complex are mapped in @individual-maps, and their log2FC values are filled within each node. A major standout in the individual networks is the interaction network between apoptosis and complex V (second figure from left to right, second row), where there exists no connection between 2 the groups.

#figure(
  grid(
    columns: (1fr, 1fr, 1fr),
    align: center + horizon,
    row-gutter: 1em,
    
    // Row 1
    [#image("../images/results/classical_apoptosis_complex_i.svg", height: 4.15cm)],
    [#image("../images/results/classical_apoptosis_complex_ii.svg", height: 4.15cm)],
    [#image("../images/results/classical_apoptosis_complex_iii.svg", height: 4.15cm)],
    
    // Row 2
     // Empty placeholder shifts image iv to the middle column
    [#image("../images/results/classical_apoptosis_complex_iv.svg", height: 4.15cm)],
    [#image("../images/results/classical_apoptosis_complex_v.svg", height: 4.15cm)],
  ),
  kind: image,
  caption: [Protein interaction network from apoptotic and respiratory complex genes in classical GBM.],
) <individual-maps>

The count of edges connecting apoptotic and respiratory complex genes are shown in @edge-count. The interactions of each of the complexes with apoptosis can vary. Excluding complex V,  complex III has the lowest number of interactions of 9, and complex I with the highest number of interactions of 25.

#import table: cell, header, hline, vline
#[
    #show table.cell.where(y: 0): strong
    #figure(
        table(
            columns: 6,
            stroke: none,
            align: center + horizon,
            table.header(
                table.hline(),
                table.vline(),
                [],
                table.vline(),
                [Complex I],
                table.vline(),
                [Complex II],
                table.vline(),
                [Complex III],
                table.vline(),
                [Complex IV],
                table.vline(),
                [Complex V]
            ),
            table.hline(),
            
            [*Apoptosis*],
            num(25),
            num(13),
            num(9),
            num(10),
            num(0), table.vline(),
            table.hline(),
        ),
        caption: [Interaction networks' edge count],
    )<edge-count>
]

Possible biological meaning and explanation of all shown results above are discussed in detail in  Section @cyto.