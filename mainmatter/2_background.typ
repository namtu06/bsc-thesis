#import "../preamble.typ": *

= Theoretical Background <background>


== Glioblastoma <gbm-intro>

Glioblastoma multiforme (GBM) is one of the most aggressive and most common form of gliomas, with an extremely poor prognosis of a median survival period of 12-15 months @lemee2018 @hanif2017. To date, GBM has no clear carcinogenetic cause, with high exposure to ionizing radiation being the only confirmed risk. Common carcinogenetic causes of other cancers such as smoking, diet, pesticide exposure, etc. have not been shown to cause GBM @hanif2017.

The World Health Organization classifies gliomas into grades I to IV, with grade I being relatively unproliferative and can be eliminated via surgery, and grade IV being the most invasive and highly malignant — GBM is classified under grade IV @hanif2017. Additionally, GBM possesses an extreme heterogeneity in its structure which results in its resistance to conventional therapies and high recurrence rate @singh2022.  



== Molecular mechanisms of glioblastoma

=== Molecular heterogeneity and subtypes
As discussed, GBM posses an incredible molecular heterogeneity. Defining mutations of GBM include _EGFR, IDH1, PTEN, TP53, MGMT_ methylation promoter, and many others, with vastly differing levels of expression per sample @verhaak2010 @hanif2017. This shows that GBM is not a single uniform disease, and different molecular profiles can correspond to different biological characteristics of the same disease.

A major analysis done by Verhaak et al. @verhaak2010 of GBM samples from The Cancer Genome Atlas (TCGA), often cited by other papers, categorizes GBM into 4 major subtypes according to their expression of signature genes: Proneural, Neural, Mesenchymal, and Classical.

The Proneural subtype is characterized by major alteration of the PDGFRA gene and point mutation of _IDH1_, and it also had the most _TP53_ mutations in the TCGA dataset; functional analysis points to developmental neuron-related processes. Neural subtype can be identified by expression of neural markers such as _NEFL, GABRA1, SYT1 and SLC12A5_ similarly to that of normal neurons, functional analysis of the genes show high involvement in neuron projection and synaptic activities. Mesenchymal subtype has genes in the tumor necrosis factor super family such as NF1 highly expressed, reflecting its tendency to have higher overall necrosis compared to other subtypes @verhaak2010 @singh2022. 

According to Verhaak et al. @verhaak2010, while _EGFR_ are likely important across all subtypes, analysis shows that it has an even more impactful role in the Classical subtype where high-level _EGFR_ amplification was observed to occur in 97% of the samples and infrequently occuring in other subtypes. Alongside that, there is a distinct lack of _TP53_ mutation in the Classical subtype even though it is the most frequently mutated gene in GBM as a whole. Homozygous deletion of chromosome 9p21.3 also occured in 94% of the samples, affecting _CDKN2A_. This shows that the Classical subtype is characterized by a distinct molecular profile with alterations in regulatory pathways involving receptor signalling, cell-cycle regulation, and tumor suppression @singh2022. The functional consequences of these alterations are discussed in the following section.

=== Major molecular pathways altered in GBM


=== Molecular alterations and tumour cell survival


Collectively, these molecular alterations disrupt signalling pathways involved in cell proliferation, cell-cycle regulation, and cellular survival. Particularly, alterations affecting survival pathways allow abnormal genes to continue multiplying despite cellular damage or other signals that would otherwise signal their death, contributing to GBM's invasiveness @lee2023. As such, the dysregulation of cellular survival and death mechanisms are an important aspect to be inspected further. Among these mechanisms, apoptosis is particularly relevant because it is among one of the most common forms of regulated cell death @lee2023. 

== Apoptosis in glioblastoma




== Mitochondrial function and respiratory complexes

 its intrisic pathway is closely associated with mitochondrial function, linking apoptosis to mitochondrial processes such as oxidative phosphorylation and the activity of mitochondrial respiratory complexes @lee2023

== Transcriptomics and computational analysis the transcriptome

Transcriptomics technologies obtains information on how genes are expressed an organism's DNA by looking through all the RNA transcripts produced from the DNA @lowe2017. According to Lowe et al. @lowe2017, there are two main ways of approaching the reading of RNA, including (1) quantifying predetermined sequences with microarrays, and (2) using RNA sequencing (RNA-seq) which also identifies sequences that were not predetermined via high-throughput sequencing. The Clinical Proteomic Tumor Analysis Consortium (CPTAC), among with other public databases, has deposited a large amount of transcriptomic profiling data for numerous tumor types including that of glioblastoma @kim2024.
The thesis utilizes CPTAC's GBM Discovery Study data.

Comparitive profiling is the process of comparing expression levels of one sample against another (e.g. a diseased sample against a healthy sample) to identify and understand molecular causes of biological processes @altelaar2013.


The platform used for functional analysis is the Gene Ontology (GO) database. It provides structured and standardized representation of biological activities according to gene products,
organized into three main aspects: (1) Molecular Functions (MF), (2) Cellular Components (CC), and (3) Biological Processes (BP) @geneontology.

Gene Ontology enrichment analysis is commonly performed following differential expression analysis to determine whether particular GO terms — items belonging to each of the aforementioned aspects — are statistically overrepresented within a set of differentially expressed genes compared with a suitable background gene set instead of inspecting individual genes in isolation @ashburner2000 @yu2012. In the context of glioblastoma, GO enrichment provides insight into biological mechanisms associated with each molecular subtype.

Although all three GO ontologies provide complementary biological information, this thesis focuses primarily on the Biological Process ontology, as it describes coordinated cellular pathways and processes that can subsequently be related to regulated cell death signalling pathways.




