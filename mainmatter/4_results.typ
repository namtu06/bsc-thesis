#import "../preamble.typ": *

= Results <results>

== Differentially Expressed Genes in Classical GBM <diff-results>

To identify genes that are meaningfully differentially expressed and their distribution, a volcano plot was used. Displayed in @volcano is the volcano generated from the differential analysis results performed with PyDESeq2, with $log_2"FC"$ on the x-axis and its $-log_10("adjusted" p"-value")$ on the y-axis for a single gene. The plot shows a large portion of the genes in the GBM samples are 
significantly differentially expressed, and the change in expression and their statistical significance vary. Absolute values $log_2"FC"$ can ran range from 0 to 15, and $-log_10(p)$ can reach over 300, corresponding to $p = 10^(-300)$.
#figure(
    grid(
        columns: 1,
        row-gutter: 1em,
    )[
        #image("../images/results/volcano.png", height: 10cm,
        )
    ],
    kind: image,
    caption:[Classical GBM vs GTEx Control Volcano Plot. There are 27.300 total significantly differentially expressed genes. More specifically, there are 20.300 significantly up-regulated genes (colored in red), and 7.000 significantly down-regulated genes (colored in blue).  ] 
    ,
) <volcano>

Of the 45.000 results produced by PyDESeq2, roughly 27.300 genes were identified to be significantly differentially expressed - around 60%. More specifically, 20.300 of the 27.300 were up-regulated with mean $log_2"FC"$ of $3.98$, and the remaining 7.000 genes were down-regulated with mean $log_2"FC"$ of $-2.71$. The bulk of the log2FC values lie within approximately 5 log2FC units for downregulated genes and 10 log2FC units for upregulated genes. 


==  Functional enrichment of differentially expressed genes <gene-ont>
Further bringing the results to the systems level, functional enrichment is performed to identify BPs that are overrepresented by different subsets of genes within the set of identified DEGs from the previous analysis. With the set of significant DEGs obtained from the differential analysis, they are enriched with GO to identify overrepressented biological processes in the GBM samples. The results of the enrichment are displayed as a dot plot in @goenrichment where the top 20 overrepresented GO Biological terms are presented along with their statistical significance and the count of their representing genes. 

Biological processes with connections to mitochondrial respiration, either directly stated its name or are a smaller process making up the entire respiration process, are highlighted in red to visualize their portions relative to the other identified BPs. 
Of the top 20 overrepresented BPs in terms of gene counts, 9 were identified to be be related to the respitatory functions of the mitochondria; all with corresponding $p<0.05$. Furthermore, 7 out of 9 identified mitochondrial respiration-related BPs lie within the top 10 overrepresented BPs.



#figure(
    grid(
        columns: 1,
        row-gutter: 1em,
    )[
        #image("../images/results/goenrichment.png", height: 9.57cm,
        )
    ],
    kind: image,
    caption:[GO Enrichment dot plot. Terms were ranked based on count of representing genes. Terms with same number of representing genes are ranked based on $-log_10("adjusted-"p)$. Terms related to mitochondrial respiration are highlighted in red. Of the top 20 overrepresented BPs, 9 were involved in mitochondrial respiration; all with corresponding $p<0.05$.] 
    ,
) <goenrichment>

This shows that the dysregulation of the mitochondrial respiration process does not occur by chance. Because this process has a crucial role in maintain normal mitochondrial function, the resulting improper apoptosis may also not occur by chance; further validating the lack of cell death being one of the main drivers of GBM proliferation. 

== Association between apoptosis and mitochondrial respiratory complexes <cell-death-int>



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
    caption:[Protein interaction network from apoptotic and respiratory complex genes in classical GBM. Each protein (node) is colored with its corresponding involvement(s). The edges are colored according to the STRING confidence scores. CYCS is observed to be a majorly involved protein, connecting the two separated cohorts of respiratory complexes and apoptosis proteins.] 
    ,
) <general-network>

The two major groups are distinct from one another, and connect with each other through a single apoptotic protein that is CYCS. The STRING combined score of the interactions present start from at least 0.90 to as high as 0.999, with many of the interactions connected to CYCS lie in the higher end of the range. This implies that the gene resulting in CYCS plays a major role in mediating the interaction between the 2 groups. 

The relationship between mitochondrial energy metabolism and apoptosis is particularly relevant in GBM, as mitochondrial processes are involved not only in energy production but also in the regulation of apoptotic pathways @nagy2015. In particular, cytochrome c, encoded by identified CYCS protein, has a dual role as a component of the mitochondrial electron transport chain and as a central mediator of the intrinsic apoptotic pathway. Under apoptotic conditions, the release of cytochrome c from mitochondria into the cytosol contributes to the formation of the apoptosome and subsequent activation of downstream caspases @jan2019 @kalpage2020. The identification of CYCS within the relationship between apoptotic genes and mitochondrial respiratory complexes is therefore consistent with past established biological connection. Rather than representing a newly identified mechanism, the result demonstrates that the computational analysis was able to reliably reconstruct the relationship, enabling further analysis.

For further inspection of the biological connection, the interactions between apoptosis and each of the respiratory complex are mapped in @individual-maps, and their $log_2"FC"$ values are filled within each node. A major standout in the individual networks is the interaction network between apoptosis and complex V (second subfigure from left to right, second row), where there exists no connection between 2 the groups.



#figure(
  grid(
    columns: (1fr, 1fr, 1fr),
    align: center + horizon,
    gutter: 1.5em,
    
    // Row 1
    stack(
      dir: ttb, spacing: 0.5em, align(left)[*A*],
      image("../images/results/classical_apoptosis_complex_i.svg", height: 5.25cm)
    ),
    stack(
      dir: ttb, spacing: 0.5em, align(left)[*B*],
      image("../images/results/classical_apoptosis_complex_ii.svg", height: 5.25cm)
    ),
    stack(
      dir: ttb, spacing: 0.5em, align(left)[*C*],
      image("../images/results/classical_apoptosis_complex_iii.svg", height: 5.25cm)
    ),
    
    // Row 2
    stack(
      dir: ttb, spacing: 0.5em, align(left)[*D*],
      image("../images/results/classical_apoptosis_complex_iv.svg", height: 5.25cm)
    ),
    stack(
      dir: ttb, spacing: 0.5em, align(left)[*E*],
      image("../images/results/classical_apoptosis_complex_v.svg", height: 5.25cm)
    ),
    stack(
      
      image("../images/results/network_legend.svg", height: 3.5cm)
    )
  ),
  kind: image,
  caption: [Protein interaction subnetworks in Classical GBM. Subnetworks are between *(A)* apoptosis and complex I, *(B)* apoptosis and complex II, *(C)* apoptosis and complex III, *(D)* apoptosis and complex IV, and *(E)* apoptosis and complex V.],
) <individual-maps>

Beyond the established CYCS-mediated connection between mitochondrial respiration and apoptosis, subnetwork analysis can identify additional associations between apoptotic genes and the individual mitochondrial respiratory complexes. These findings extend the analysis beyond the canonical relationship and provide a more detailed view of how apoptotic genes may be connected to different components of the mitochondrial respiratory chain in Classical GBM.

The interactions of each of the complexes with apoptosis can be seen to vary. The count of edges connecting apoptotic and respiratory complex genes are shown in @edge-count. Excluding complex V which had 0 interactions,  complex III has the lowest number of interactions, and complex I with the highest number of interactions, followed by complex II, complex IV, and complex III. The number of connections alone do not definitively indicate the complexes' amount of involvement in apoptosis. Nevertheless, they still give insight into how some complexes are more directly involved than others, this is discussed in further detail in Section @minor-network-discuss.

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
        caption: [Interaction subnetwork edge count],
    )<edge-count>
]





To see which proteins are participating in the CYCS-mediated connection between apoptosis and respiratory complexes, the specific names of the proteins with direct connection with CYCS in the network are identified.

#import table: cell, header, hline, vline
#[
    #show table.cell.where(y: 0): strong
    #figure(
        table(
            columns: 2,
            stroke: none,
            align: center + horizon,
            table.header(
                table.hline(),
                table.vline(),
                [],
                table.vline(),
                [Proteins with direct interaction with CYCS],
                table.vline()
            ),
            table.hline(),
            
            
            table.hline(),
            [*Complex I*],
            table.hline(),
            [COX4I1, COX4I2, COX5A, COX5B, COX6A1, COX6B1, COX6C, CYC1, MT-CO1, MT-CO2, MT-CO3, MT-CYB, SDHA, SDHB, SDHC, SDHD, UQCR10, UQCRB, UQCRC1, UQCRC2, UQCRFS1, UQCRH, UQCRQ],
            [*Complex II*],
            table.hline(),
            [CYC1, MT-CYB, SDHA, SDHB, SDHC, SDHD, UQCR10, UQCRB, UQCRC1, UQCRC2, UQCRFS1, UQCRH, UQCRQ],
            [*Complex III*],
            table.hline(),
            [CYC1, MT-CYB, UQCR10, UQCRB, UQCRC1, UQCRC2, UQCRFS1, UQCRH, UQCRQ],
            [*Complex IV*],
            table.hline(),
            [COX4I1, COX4I2, COX5A, COX5B, COX6A1, COX6B1, COX6C, MT-CO1, MT-CO2, MT-CO3],
            [*Complex V*],
            table.hline(),
            [None],
            [*Apoptosis*],
            table.hline(),
            [BAX, BCL2, BCL2L1, CASP3, CASP7, CASP8, CASP9, DIABLO, ENDOG, ITPR1, ITPR3, TP53],
        ),
        caption: [CYCS-interacting proteins encoded by identified DEGs],
    )<protein-names>
] 

The names of the CYCS-interacting proteins encoded are listed in @protein-names. A major standout are the proteins belonging to apoptosis. These proteins participate in the major events in the intrinsic signalling pathway leading up to apoptosis. Additionally, genes closely related to CYCS, such as CYC1, is present in complex I-III. All of this means it is worth investigating the expression levels of the genes encoding them. 

By looking at the $log_2"FC"$ values of the genes encoding the proteins above, inference can be made about the activity of apoptosis and mitochondrial respiration in Classical GBM compared to health brain tissue.
As such, the genes representing the mitochondrial respiration processes, the genes' $log_2"FC"$ magnitudes are visualized as a bar graph in @fcs. 


#figure(
  grid(
    rows: 2,
    row-gutter: 1.5em,
    stack(
      dir: ttb,
      spacing: 0.5em,
      align(left)[*A*],
      image("../images/results/classical_apoptosis_log2fc.svg", width: 100%)
    ),
    stack(
      dir: ttb,
      spacing: 0.5em,
      align(left)[*B*],
      image("../images/results/classical_mitochondrial_complexes_log2fc.svg", width: 100%)
    )
    
  ),
  kind: image,
  caption: [$"Log"_2"FC"$ bar graph of CYCS-interacting-protein encoding genes in *(A)* in apoptosis, and *(B)* respiratory complexes.]
) <fcs>

In the respiratory complexes' genes, down-regulation is seen to happen across all the complexes, excluding complex V. Network-wise, it can inferred that the connection between respiratory complexes and apoptosis may be broken, as although the major connecting CYCS gene is present, the genes connecting the respiratory complexes with CYCS themselves are down-regulated. At a higher systems level, this suggests that there is a global breakdown of the OXPHOS process in Classical GBM, leading to improper mitochondrial functions and ultimately the previously-discussed improper regulation of cell death. 

The dysregulation of apoptotic genes encoding proteins connected to CYCS are not homogeneous. In particular, the genes for the final caspases that ultimately trigger apoptosis - CASP3 and CASP7 - are upregulated. In the extrinsic pathway, the major caspase gene CASP8 is upregulated by 2 fold-change units. In the intrinsic pathway, TP53, BCL2, and BAX are all genes for proteins that act as major upstream activations of the pathway. However, the subsequent downstream activation caspase 9 encoded by CASP9 is down-regulated. Additionally, genes assisting in the activation of the intrinsic pathway and release of the caspases such as ITPR3, DIABLO, and ENDOG are down-regulated. In general, there is a distinct discrepancy in the dysregulation of the apoptotic genes, where the genes are neither all up-regulated or down-regulated.


