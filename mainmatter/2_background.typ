#import "../preamble.typ": *

= Theoretical Background <background>


== Glioblastoma <gbm-intro>

Glioblastoma multiforme (GBM) is one of the most aggressive and most common form of gliomas, with an extremely poor prognosis of a median survival period of 12-15 months @lemee2018 @hanif2017. To date, GBM has no clear carcinogenetic cause, with high exposure to ionizing radiation being the only confirmed risk. Common carcinogenetic causes of other cancers such as smoking, diet, pesticide exposure, etc. have not been shown to cause GBM @hanif2017.

The World Health Organization classifies gliomas into grades I to IV, with grade I being relatively unproliferative and can be eliminated via surgery, and grade IV being the most invasive and highly malignant — GBM is classified under grade IV @hanif2017. Additionally, GBM possesses an extreme heterogeneity in its structure which results in its resistance to conventional therapies and high recurrence rate @singh2022.  



== Molecular mechanisms of glioblastoma
Defining genetic mutations of GBM include _EGFR, IDH1, PTEN, TP53, MGMT_ methylation promoter, and many others @verhaak2010 @hanif2017. A major analysis done by Verhaak et al. @verhaak2010 of GBM samples from The Cancer Genome Atlas (TCGA), often cited by other papers, categorizes GBM into 4 major subtypes according to their expression of signature genes: Proneural, Neural, Mesenchymal, and Classical.

The Proneural subtype is characterized by major alteration of the PDGFRA gene and point mutation of _IDH1_, and it also had the most _TP53_ mutations in the TCGA dataset; functional analysis points to developmental neuron-related processes. Neural subtype can be identified by expression of neural markers such as _NEFL, GABRA1, SYT1 and SLC12A5_; functional analysis of the genes show high involvement in neuron projection and synaptic activities. Mesenchymal subtype has genes in the tumor necrosis factor super family highly expressed, reflecting its tendency to have higher overall necrosis compared to other subtypes @verhaak2010. 

According to Verhaak et al. @verhaak2010, while _EGFR_ are likely important across all subtypes, analysis shows that it has an even more impactful role in the Classical subtype — the main subtype investigated in this thesis — having the highest percentage of _EGFR_ mutation within a single subtype. Alongside that, there is a distinct lack of _TP53_ mutation in the Classical subtype even though it is the most frequently mutated gene in GBM as a whole. Deletion of the 9p21.3 locus on both chromosomes that carry it is also a defining mutation of the Classical subtype, affecting _CDKN2A_.

Advanced sequencing technologies emphasizes the need for therapies to target both molecular drivers of the tumors and their arised microenvironment; one of the promising path to battle GBM involves precision medicine, leveraging computational methods for targeted therapy selection and resistance prediction @singh2022. 


== Apoptosis in glioblastoma


- *Apoptosis*:


Each programmed cell death mode is regulated by a characteristic network of genes and proteins @qian2024. 


== Mitochondrial function and respiratory complexes

 @lee2023

== Transcriptomics and computational analysis the transcriptome

Transcriptomics technologies obtains information on how genes are expressed an organism's DNA by looking through all the RNA transcripts produced from the DNA @lowe2017. According to Lowe et al. @lowe2017, there are two main ways of approaching the reading of RNA, including (1) quantifying predetermined sequences with microarrays, and (2) using RNA sequencing (RNA-seq) which also identifies sequences that were not predetermined via high-throughput sequencing. The Clinical Proteomic Tumor Analysis Consortium (CPTAC), among with other public databases, has deposited a large amount of transcriptomic profiling data for numerous tumor types including that of glioblastoma @kim2024.
The thesis utilizes CPTAC's GBM Discovery Study data.

Comparitive profiling is the process of comparing expression levels of one sample against another (e.g. a diseased sample against a healthy sample) to identify and understand molecular causes of biological processes @altelaar2013.


The platform used for functional analysis is the Gene Ontology (GO) database. It provides structured and standardized representation of biological activities according to gene products,
organized into three main aspects: (1) Molecular Functions (MF), (2) Cellular Components (CC), and (3) Biological Processes (BP) @geneontology.

Gene Ontology enrichment analysis is commonly performed following differential expression analysis to determine whether particular GO terms — items belonging to each of the aforementioned aspects — are statistically overrepresented within a set of differentially expressed genes compared with a suitable background gene set instead of inspecting individual genes in isolation @ashburner2000 @yu2012. In the context of glioblastoma, GO enrichment provides insight into biological mechanisms associated with each molecular subtype.

Although all three GO ontologies provide complementary biological information, this thesis focuses primarily on the Biological Process ontology, as it describes coordinated cellular pathways and processes that can subsequently be related to regulated cell death signalling pathways.




