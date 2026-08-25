#import "../preamble.typ": *

= Theoretical Background <background>


== Glioblastoma <gbm-intro>

Glioblastoma multiforme (GBM) is one of the most aggressive and most common form of gliomas, with an extremely poor prognosis of a median survival period of 12-15 months @lemee2018 @hanif2017. To date, GBM has no clear carcinogenetic cause, with high exposure to ionizing radiation being the only confirmed risk. Common carcinogenetic causes of other cancers such as smoking, diet, pesticide exposure, etc. have not been shown to cause GBM @hanif2017.

The World Health Organization classifies gliomas into grades I to IV, with grade I being relatively unproliferative and can be eliminated via surgery, and grade IV being the most invasive and highly malignant — GBM is classified under grade IV @hanif2017. Additionally, GBM possesses an extreme heterogeneity in its structure which results in its resistance to conventional therapies and high recurrence rate @singh2022.  



== Molecular mechanisms of glioblastoma

=== Molecular heterogeneity and subtypes
As discussed, GBM posses an incredible molecular heterogeneity. Defining mutations of GBM include @tang2025 @singh2022:
- *_TP53_ mutations*: Appear in 31-38% of all GBM patients, play a role in disrupting cell cycle regulation and apoptosis.
- *_PTEN_ mutations*: Appears in 24-37% of GBM patients, activate tumor-survival-enducing pathways.
- *_EGFR_ amplifcation and mutations*: Appears in 36-60% of GBM patients, enhances cell growth.
- *and many others*.

The expression levels of the genes listed vary vastly on a per-sample basis @verhaak2010 @hanif2017. This shows that GBM is not a single uniform disease, and different molecular profiles can correspond to different biological characteristics of the same disease.

A major analysis done by Verhaak et al. @verhaak2010 of GBM samples from The Cancer Genome Atlas (TCGA), often cited by other papers, categorizes GBM into 4 major subtypes according to their expression of signature genes: Proneural, Neural, Mesenchymal, and Classical.

The Proneural subtype is characterized by major alteration of the PDGFRA gene and point mutation of _IDH1_, and it also had the most _TP53_ mutations in the TCGA dataset; functional analysis points to developmental neuron-related processes. Neural subtype can be identified by expression of neural markers such as _NEFL, GABRA1, SYT1 and SLC12A5_ similarly to that of normal neurons, functional analysis of the genes show high involvement in neuron projection and synaptic activities. Mesenchymal subtype has genes in the tumor necrosis factor super family such as NF1 highly expressed, reflecting its tendency to have higher overall necrosis compared to other subtypes @verhaak2010 @singh2022. 

According to Verhaak et al. @verhaak2010, while _EGFR_ are likely important across all subtypes, analysis shows that it has an even more impactful role in the Classical subtype where high-level _EGFR_ amplification was observed to occur in 97% of the samples and infrequently occuring in other subtypes. Alongside that, there is a distinct lack of _TP53_ mutation in the Classical subtype even though it is the most frequently mutated gene in GBM as a whole. Homozygous deletion of chromosome 9p21.3 also occured in 94% of the samples, affecting _CDKN2A_. This shows that the Classical subtype is characterized by a distinct molecular profile with alterations in regulatory pathways involving receptor signalling, cell-cycle regulation, and tumor suppression @singh2022. The functional consequences of these alterations are discussed in the following section.

=== Major molecular pathways altered in GBM

Molecular alterations in GBM described above significantly affect pathways governing fundamental biological cellular processes, and the dysregulation of these processes promotes growth, invasion, and resistance to therapy in GBM @singh2022.

A few of the most common pathways dysregulated (out of the several dozens) are @singh2022 @tang2025 @gomes2025:
- *RTK/EGFR Signaling*: EGFR is a receptor tyrosine kinase whose activation stimulates downstream signalling pathways including PI3K/AKT/mTOR. Amplification or other activating alterations of EGFR can therefore result in persistent signalling that promotes tumour proliferation and survival.
- *PI3K/AKT/mTOR*: A central pathway influencing cell survival and proliferation with _EGFR_ as a major upstream activator, the activation of which promotes tumor growth and treatment resistance. The tumor-supressing gene _PTEN_ negatively affects the pathway, meaning the loss of it exacerbates GBM's aggressiveness.
- *p53*: _TP53_ being a major component, the pathway governs cell cycle and apoptosis. Dysregulation leads to uncontrolled proliferation and impaired cell death.


Collectively, these alterations have the tendency to disrupt signalling pathways involved in cell proliferation, cell-cycle regulation, and cellular survival. Particularly, alterations affecting survival pathways allow abnormal genes to continue multiplying despite cellular damage or other signals that would otherwise signal their death, contributing to GBM's invasiveness @lee2023. As such, the dysregulation of cellular survival and death mechanisms are an important aspect to be inspected further. Among these mechanisms, apoptosis is particularly relevant because it is among one of the most common forms of regulated cell death @lee2023. 







== Apoptosis in glioblastoma

Regulated cell death, or cell apoptosis, is one of the most researched form of cell death @lee2023. It has 2 main pathways depending on the molecular interactions involved: (1) *intrinsic or mitochondrial pathway*, triggered by a variety of both extra- and intra-celullar stress, and (2) *extrinsic or death receptor pathway*, activated when extracellular ligands attach to certain extracellular receptors and resulting in the formation of death-inducing signalling complexes @lee2023 @jan2019. More specifically, the cascades of interactions leading to apoptosis are @jan2019:
- Intrinsic pathway: stress induces the production of proteins in the Bcl-2 family which when inserted into the mitochondrial membrane, releasing cytochrome c. Cytochrome c combines with Apaf-1 and procaspase-9, producing the apoptosome complex that triggers the activation of caspase-9,
- Extrinsic pathway: extracellular ligands include TNF (tumor necrosis factor), Fas-L (Fas ligand), and TRAIL (TNF-related apoptosis-inducing ligand), when attached to their respective extracellular portion of transmembrane receptors, forms a death-inducing signalling complex (DISC) and leads to the activation of caspase-8,

with both ultimately converging on the activation of executioner caspases which start the main process of apoptosis, better visualized in @cell-death-pathway-diagram. The main process involves loss of inner mitochondrial membrane potential, hyperproduction of superoxide ions, outflow of matrix calcium glutathione, and release of membrane proteins, rendering the cell "dead" @jan2019.

#figure(
    grid(
        columns: 1,
        row-gutter: 1em,
    )[
        #image("../images/deathpathway.jpg"
        )
    ],
    kind: image,
    caption:[Pathways of Apoptosis @jan2019] 
    ,
) <cell-death-pathway-diagram>

Apoptosis, when functioning normally, is essential for normal development and tissue homeostasis, while its dysregulation has been implicated in various diseases, including cancer. In cancer, impaired apoptotic signalling can allow cells carrying genomic abnormalities to evade elimination and continue proliferating, thereby contributing to tumour development and progression. Consequently, the ability of cancer cells to evade apoptosis is considered an important characteristic of tumorigenesis @gomes2025 @lee2023.

The intrinsic apoptotic pathway is closely associated with mitochondrial function. Mitochondrial outer membrane permeabilization and the subsequent release of cytochrome c represent key events in this pathway. At the same time, mitochondria are responsible for essential metabolic processes, including oxidative phosphorylation through the mitochondrial respiratory chain @lee2023 @jan2019. This connection between mitochondrial function and apoptosis provides a basis for examining the relationship between apoptosis-associated genes and mitochondrial respiratory complexes, which is discussed further in the following section .

== Mitochondrial function and respiratory complexes



== Gene expression analysis

=== Challenges in non-computational methods

=== Overcoming the challenges with computational methods

=== Multiomics 

=== Transcriptomics of GBM

Transcriptomics technologies obtains information on how genes are expressed an organism's DNA by looking through all the RNA transcripts produced from the DNA @lowe2017. According to Lowe et al. @lowe2017, there are two main ways of approaching the reading of RNA, including (1) quantifying predetermined sequences with microarrays, and (2) using RNA sequencing (RNA-seq) which also identifies sequences that were not predetermined via high-throughput sequencing. The Clinical Proteomic Tumor Analysis Consortium (CPTAC), among with other public databases, has deposited a large amount of transcriptomic profiling data for numerous tumor types including that of glioblastoma @kim2024.
The thesis utilizes CPTAC's GBM Discovery Study data.

Comparitive profiling is the process of comparing expression levels of one sample against another (e.g. a diseased sample against a healthy sample) to identify and understand molecular causes of biological processes @altelaar2013.


The platform used for functional analysis is the Gene Ontology (GO) database. It provides structured and standardized representation of biological activities according to gene products,
organized into three main aspects: (1) Molecular Functions (MF), (2) Cellular Components (CC), and (3) Biological Processes (BP) @geneontology.

Gene Ontology enrichment analysis is commonly performed following differential expression analysis to determine whether particular GO terms — items belonging to each of the aforementioned aspects — are statistically overrepresented within a set of differentially expressed genes compared with a suitable background gene set instead of inspecting individual genes in isolation @ashburner2000 @yu2012. In the context of glioblastoma, GO enrichment provides insight into biological mechanisms associated with each molecular subtype.

Although all three GO ontologies provide complementary biological information, this thesis focuses primarily on the Biological Process ontology, as it describes coordinated cellular pathways and processes that can subsequently be related to regulated cell death signalling pathways.




