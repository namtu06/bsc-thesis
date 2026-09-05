#import "../preamble.typ": *

= Theoretical Background <background>


== Glioblastoma <gbm-intro>

Glioblastoma multiforme (GBM) is one of the most aggressive and most common form of gliomas, with an extremely poor prognosis of a median survival period of 12-15 months @lemee2018 @hanif2017. To date, GBM has no clear carcinogenetic cause, with high exposure to ionizing radiation being the only confirmed risk. Common carcinogenetic causes of other cancers such as smoking, diet, pesticide exposure, etc. have not been shown to cause GBM @hanif2017.

The World Health Organization classifies gliomas into grades I to IV, with grade I being relatively unproliferative and can be eliminated via surgery, and grade IV being the most invasive and highly malignant — GBM is classified under grade IV @hanif2017. Additionally, GBM possesses an extreme heterogeneity in its structure which results in its resistance to conventional therapies and high recurrence rate @singh2022. A recent review article by David Eisenbarth and Y. Alan Wang @eisenbarth2023 identified at least 10 major areas of heterogeneity in GBM's biology, presenting vast amounts of fronts to tackle therapeutically.

== Molecular mechanisms of glioblastoma

=== Molecular heterogeneity and subtypes
GBM possesses an incredible molecular heterogeneity. Defining transcriptomic mutations of GBM include @tang2025 @singh2022:
- *_TP53_ mutations*: Appear in 31-38% of all GBM patients, play a role in disrupting cell cycle regulation and apoptosis.
- *_PTEN_ mutations*: Appears in 24-37% of GBM patients, activate tumor-survival-enducing pathways.
- *_EGFR_ amplifcation and mutations*: Appears in 36-60% of GBM patients, enhances cell growth.
- *and many others*.

The expression levels of the genes listed vary vastly on a per-sample basis @verhaak2010 @hanif2017 @eisenbarth2023. This shows that GBM is not a single uniform disease, and different molecular profiles can correspond to different biological characteristics of the same disease.

According to Verhaak et al. and other further sequencing experiments @verhaak2010 @eisenbarth2023, GBM is categories into 3 major subtypes according to their expression of signature genes: Proneural, Mesenchymal, and Classical. Each subtype have their own distinct levels of expression of the the defining genes and resistance to therapies. However, GBM samples have been shown to convert from one subtype to another during tumor progression and recurrence, contributing to its agressiveness and resistance to therapies. @eisenbarth2023.

The Proneural subtype is characterized by major alteration of the PDGFRA gene and point mutation of _IDH1_, and it also had the most _TP53_ mutations in the TCGA dataset; functional analysis points to developmental neuron-related processes. Mesenchymal subtype has genes in the tumor necrosis factor super family such as NF1 highly expressed, reflecting its tendency to have higher overall necrosis compared to other subtypes @verhaak2010 @singh2022. 

According to Verhaak et al. @verhaak2010, while _EGFR_ are likely important across all subtypes, analysis shows that it has an even more impactful role in the Classical subtype where high-level _EGFR_ amplification was observed to occur in 97% of the samples and infrequently occuring in other subtypes. Alongside that, there is a distinct lack of _TP53_ mutation in the Classical subtype even though it is the most frequently mutated gene in GBM as a whole. Homozygous deletion of chromosome 9p21.3 also occured in 94% of the samples, affecting _CDKN2A_. This shows that the Classical subtype is characterized by a distinct molecular profile with alterations in regulatory pathways involving receptor signalling, cell-cycle regulation, and tumor suppression, justifying further investigation of this specific subtype @singh2022. The functional consequences of these alterations are discussed in the following section.

=== Major molecular pathways altered in GBM

Molecular alterations in GBM described above significantly affect pathways governing fundamental biological cellular processes, and the dysregulation of these processes promotes growth, invasion, and resistance to therapy in GBM @singh2022.

A few of the most common pathways dysregulated (out of the several dozens) are @singh2022 @tang2025 @gomes2025:
- *RTK/EGFR Signaling*: EGFR is a receptor tyrosine kinase whose activation stimulates downstream signalling pathways including PI3K/AKT/mTOR. Amplification or other activating alterations of EGFR can therefore result in persistent signalling that promotes tumour proliferation and survival.
- *PI3K/AKT/mTOR*: A central pathway influencing cell survival and proliferation with _EGFR_ as a major upstream activator, the activation of which promotes tumor growth and treatment resistance. The tumor-supressing gene _PTEN_ negatively affects the pathway, meaning the loss of it exacerbates GBM's aggressiveness.
- *p53*: _TP53_ being a major component, the pathway governs cell cycle and apoptosis. Dysregulation leads to uncontrolled proliferation and impaired cell death.


Collectively, these alterations have the tendency to disrupt signalling pathways involved in cell proliferation, cell-cycle regulation, and cellular survival. Particularly, alterations affecting survival pathways allow abnormal genes to continue multiplying despite cellular damage or other signals that would otherwise signal their death, contributing to GBM's invasiveness @lee2023. As such, the dysregulation of cellular survival and death mechanisms are an important aspect to be inspected further. Among these mechanisms, apoptosis is particularly relevant because it is among one of the most common forms of regulated cell death @lee2023. 







== Apoptosis in glioblastoma

Apoptosis, when functioning normally, is essential for normal development and tissue homeostasis, while its dysregulation has been implicated in various diseases, including cancer. In cancer, impaired apoptotic signalling can allow cells carrying genomic abnormalities to evade elimination and continue proliferating, thereby contributing to tumour development and progression. Consequently, the ability of cancer cells to evade apoptosis is considered an important characteristic of tumorigenesis @gomes2025 @lee2023.

Apoptosis has 2 main pathways depending on the molecular interactions involved: (1) *intrinsic or mitochondrial pathway*, triggered by a variety of both extra- and intra-celullar stress, and (2) *extrinsic or death receptor pathway*, activated when extracellular ligands attach to certain extracellular receptors and resulting in the formation of death-inducing signalling complexes @lee2023 @jan2019. More specifically, the cascades of interactions leading to apoptosis are @jan2019:
- *Intrinsic pathway*: stress induces the production of proteins in the Bcl-2 family which when inserted into the mitochondrial membrane, releasing cytochrome c. Cytochrome c interacts with Apaf-1 and procaspase-9, producing the apoptosome complex that triggers the activation of caspase-9,
- *Extrinsic pathway*: extracellular ligands include TNF (tumor necrosis factor), Fas-L (Fas ligand), and TRAIL (TNF-related apoptosis-inducing ligand), when attached to their respective extracellular portion of transmembrane receptors, forms a death-inducing signalling complex (DISC) and leads to the activation of caspase-8,

with both ultimately converging on the activation of executioner caspases which start the main process of apoptosis, better visualized in @cell-death-pathway-diagram. The main process involves loss of inner mitochondrial membrane potential, hyperproduction of superoxide ions, outflow of matrix calcium glutathione, and release of membrane proteins, rendering the cell "dead" @jan2019.

#figure(
    grid(
        columns: 1,
        row-gutter: 1em,
    )[
        #image("../images/deathpathway.jpg",height: 12cm,
        )
    ],
    kind: image,
    caption:[Pathways of Apoptosis @jan2019] 
    ,
) <cell-death-pathway-diagram>

The major molecular pathways affected in GBM discussed in the previous section, in one way or another, lead to the alteration of the apoptosis process described above. Altered apoptotic signalling can contribute to GBM's survival and resistance against multiple forms of therapy.

The intrinsic apoptotic pathway is closely associated with mitochondrial function. Mitochondrial outer membrane permeabilization and the subsequent release of cytochrome c represent key events in this pathway. At the same time, mitochondria are responsible for essential metabolic processes, including oxidative phosphorylation through the mitochondrial respiratory chain @lee2023 @jan2019. This connection between mitochondrial function and apoptosis provides a basis for examining the relationship between apoptosis-associated genes and mitochondrial respiratory complexes, which is discussed further in the next section.





== Mitochondrial function and respiratory complexes
=== General mitochondrial function
The mitochondria is the primary site of cellular function, and it has fundamental roles in processes such as ATP production, ROS generation, and the execution of cell death pathways @liang2025 @jan2019. Carbohydrates, fatty acids, and amino acids can be metabolised into substrates, which enters the tricarboxylic acid (TCA) cycle. The TCA cycle generates reducing equivalents, primarily NADH and FADH₂, which subsequently donate electrons to the mitochondrial respiratory chain to drive oxidative phosphorylation and ATP production @liang2025.

=== Oxidative phosphorylation and the respiratory chain

Mitochondrial oxidative phosphorylation (OXPHOS) is a key mechanism of energy production in eukaryotic cells. It is comprised of 5 inner mitochondrial protein complexes I-V (also referred to as CI, CII, etc.) and 2 mobile electron carriers forming the electron transport chain (ETC) @vercellino2022. 

The ETC *oxidizes* reducing equivalents in NADH and succinate, inducing the reduction of molecular oxygen to water and the pumping of protons across the inner mitochondrial membrane (IMM) via Complex I, III, and IV, each using their own pumping mechanism, to drive ATP synthesis @vercellino2022. The ETC also uses energy from the reducing equivalents to generated a proton gradient across the IMM, which is used by ATP synthase (Complex V) to *phosphorylate* ADP to ATP, the universal energy currency of cells . The specific roles of each complexes are as follows @vercellino2022:
- *Complex I*: Transfers electrons from NADH to ubiquinone and pumps protons.
- *Complex II*: Does not pump protons but contributes to reduction of ubiquinone.
- *Complex III*: Reduces ubiquinone and cytochrome c, in turn shuttles to Complex IV.
- *Complex IV*: Donates electron for final reduction of oxygen.
- *Complex V*: Uses proton gradient and the reduction of oxygen to synthesize ATP.

The activity of the respiratory chain is therefore essential for maintaining mitochondrial energy production and cellular function.
=== Mitochondrial respiratory chain-apoptosis relationship in GBM <mito-apop-connect>

The mitochondrial respiratory chain and (intrinsic) apoptosis can be seen to be inherently closely connected to each other. While the respiratory chain is essential for maintaining mitochondrial energy production and homeostasis, intrinsic apoptosis depends on the mitochondria for the regulation of apoptotic signalling. Therefore, disruption of respiratory-chain function and mitochondrial homeostasis can influence apoptotic signalling particularly through cytochrome c because of its involvement in both cellular respiration and apoptosis (@cytc) @nagy2015 @kalpage2020.

#figure(
    grid(
        columns: 1,
        row-gutter: 1em,
    )[
        #image("../images/cytc.jpg",height: 12cm,
        )
    ],
    kind: image,
    caption:[Proposed cytochrome c involvement in cellular respiration and apoptosis @kalpage2020. Cytochrome c acts as an electron carrier between Complex III and IV. Cellular stress causes cytochrome c to be released from the mitochondria, followed by a variety of interactions that produce apoptosome, resulting in apoptosis @jan2019 @kalpage2020.] 
    ,
) <cytc>

This relationship is particularly relevant in GBM, where alterations in mitochondrial metabolism and oxidative phosphorylation have been implicated in tumour-cell survival and progression in specific subtypes @nagy2015 @garofano2021. Changes in respiratory-chain activity may therefore influence the susceptibility of GBM cells to apoptosis. More specifically, improper functioning of the mitochondria may result in improper apoptosis, resulting in promoted tumor cell survivability.



== Transcriptomics and computational analysis

=== From conventional molecular analysis to computational approaches
Having established the relevance of apoptosis and mitochondrial respiratory-chain function in GBM, investigating alterations in the genes involved in these processes requires methods capable of measuring gene activity across large numbers of genes simultaneously.

Understanding complex biological systems requires integration of both experimental and computational approaches @kitano2002b. Kitano @kitano2002 argues that although studying individual components of an organism can provide valuable insights, such approaches alone are insufficient to understand the behaviour of the system as a whole. In molecular pathology, diseases are rarely attributable to a single gene, but instead arise from complex interactions between multiple molecular components and biological processes @barabasi2011.

Although systems-level approaches to biology had already gained considerable interest, their application was historically constrained by limitations in experimental technologies and the availability of quantitative molecular data @kitano2002. Recent advancements has made high-throughput and high quality profiling of biological systems possible, bringing forth a new set of challenges and opportunities in computationally analyzing and interpreting the new massive amount of deposited data, particularly with DNA microarrays and Mass Spectrometry (MS)-based  proteomics @greene2014 @elvitigala2010. 

Among these approaches, transcriptomic technologies provide a means of measuring genome-wide changes in gene expression, which can subsequently be analysed computationally to identify molecular alterations associated with disease. For example, transcriptomic profiling has enabled the identification of distinct molecular subtypes of GBM, presenting more specific areas of deeper research into the disease @verhaak2010.


=== Transcriptomics and differential expression analysis

Transcriptomics technologies provide information on gene expression by measuring the RNA transcripts produced from an organism's genome @lowe2017. According to Lowe et al. @lowe2017, two major approaches for measuring transcript abundance are microarrays, which quantify predetermined sequences, and RNA sequencing (RNA-seq), which uses high-throughput sequencing to measure transcript sequences without requiring them to be predetermined (@micro-seq).

#figure(
    grid(
        columns: 1,
        row-gutter: 1em,
    )[
        #image("../images/microarrayvsrnaseq.jpg",height: 10cm,
        )
    ],
    kind: image,
    caption:[Comparing how microarrays and RNA-seq produce gene expression values @rogawski2017.] 
    ,
) <micro-seq>
 
Large-scale efforts have been made to profile the transcriptomes of cancers, including GBM. Public resources such as the Gene Expression Omnibus (GEO) and The Cancer Genome Atlas (TCGA) provide access to extensive molecular profiling datasets from numerous cancer types, including glioblastoma @barrett2013 @tcga. The Clinical Proteomic Tumor Analysis Consortium (CPTAC) has further generated and integrated transcriptomic and proteomic data from cancer studies, including GBM @cptac. These resources provide opportunities for researchers to computationally reanalyse previously generated data and investigate molecular characteristics of cancer. The next challenge is therefore to extract meaningful biological information from these large-scale quantitative datasets.

Comparative profiling involves comparing molecular measurements between predefined biological conditions to identify differences associated with a particular phenotype or state @altelaar2013. In transcriptomics, differential expression analysis is commonly used to compare gene expression between conditions, such as diseased and healthy tissue. Its main objective is to identify genes whose expression differs between the conditions, providing insight into potential molecular mechanisms underlying the observed phenotype.The resulting differential expression statistics can describe both the magnitude and direction of an expression difference, commonly represented by the log2 fold change (log2FC), and its statistical significance, represented by a p-value. Thresholds can subsequently be applied to identify genes considered differentially expressed, with the choice of thresholds depending on the experimental context and research objectives @rosati2024.

A popular library for gene-level differential expression analysis is DESeq2 (with PyDESeq2 providing a Python implementation). An average workflow with DESeq2 is displayed in @deseq-flow.

#figure(
    grid(
        columns: 1,
        row-gutter: 1em,
    )[
        #image("../images/deseq-flow.pdf",height: 12cm,
        )
    ],
    kind: image,
    caption:[Conceptual workflow of differential expression analysis using DESeq2. Adapted from Harvard Chan Bioinformatics Core (HBC) @hbctraining_deseq2_analysis.] 
    ,
) <deseq-flow>

RNA-seq count data often exhibit greater variance than their mean, a property known as overdispersion. DESeq2 accounts for this by modelling count data using a negative binomial generalized linear model, from which log₂ fold changes and their standard errors are estimated. The statistical significance of the estimated log₂ fold changes is then assessed using Wald tests. DESeq2 can additionally account for known sources of systematic variation, such as batch effects, by incorporating relevant variables into the design of the statistical model. To account for the increased number of false discoveries resulting from multiple hypothesis testing, p-values are adjusted using the Benjamini–Hochberg procedure to control the false discovery rate (FDR) @hbctraining_dge_overview @pydeseq2_docs @deseq2_bioc_vignette.

=== Functional analysis and network analysis

Interpreting differentially expressed genes (DEGs) individually may provide limited insight into the broader biological processes underlying the observed changes @kitano2002. Functional enrichment analysis can instead identify biological pathways or functions that are overrepresented among the identified DEGs. @yu2012

The Gene Ontology (GO) database provides structured and standardized representation of biological activities according to gene products,
organized into three main aspects: (1) Molecular Functions (MF), (2) Cellular Components (CC), and (3) Biological Processes (BP) @geneontology. GO enrichment analysis evaluates whether particular GO terms are statistically overrepresented among a set of genes compared with an appropriate background gene set (@GO-flow) @ashburner2000 @yu2012. The process allows groups of DEGs to be interpreted in terms of shared biological functions and processes rather than as individual genes.

#figure(
    grid(
        columns: 1,
        row-gutter: 1em,
    )[
        #image("../images/GO-process.pdf",height: auto,
        )
    ],
    kind: image,
    caption:[Workflow of GO enrichment analysis. Adapted from The Gene Ontology Consortium @geneontology2021.] 
    ,
) <GO-flow>

Still, the identified overrepresented biological processes do not show how the individual genes are interacting with one another. Therefore, a network-based approach can complement the identified BPs by representing the genes as nodes and their interactions as edges, allowing for the inspection at the systems-level @barabasi2011.

Network-based approaches can reveal highly connected components, clusters of interacting molecules, and relationships between biological processes that may not be apparent when genes are considered individually. This can provide additional context for interpreting molecular alterations and identifying potential interactions between genes involved in related biological processes @barabasi2011.

In this thesis, Search Tool for the Retrieval of Interacting Genes/Proteins (STRING) was used to construct protein–protein association networks from selected differentially expressed genes. STRING maps the submitted gene identifiers to their corresponding protein products and integrates known and predicted protein associations from multiple evidence sources. The resulting networks represent proteins as nodes and their associations as edges, providing a means of examining functional relationships among the proteins encoded by the selected DEGs @szklarczyk2023.

Together, functional enrichment and network analysis therefore enable differentially expressed genes to be interpreted at a systems level, providing both information on the biological processes associated with gene-expression changes and the molecular relationships connecting the genes involved.

