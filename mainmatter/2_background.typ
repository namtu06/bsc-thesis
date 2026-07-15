#import "../preamble.typ": *

= Theoretical Background <background>

== Glioblastoma biology <glioblastoma>

Glioblastoma multiforme is one of the most aggressive and most common form of brain tumors, with an extremely poor prognosis of a median survival period of 12-15 months @lemee2018 @singh2022. GBM possesses an extreme heterogeneity in its structure which results in its resistance to conventional therapies and high recurrence rate @singh2022. 

Advanced sequencing technologies emphasizes the need for therapies to target both molecular drivers of the tumors and their arised microenvironment; one of the promising path to battle GBM involves precision medicine, leveraging computational methods for targeted therapy selection and resistance prediction @singh2022. 

== Transcriptomics and Differential Expression Analysis <transcriptomics>

Transcriptomics technologies obtains information on how genes are expressed an organism's DNA by looking through all the RNA transcripts produced from the DNA @crick1970 @lowe2017. According to Lowe et al. @lowe2017, there are two main ways of approaching the reading of RNA, including (1) quantifying predetermined sequences with microarrays, and (2) using RNA sequencing (RNA-seq) which also identifies sequences that were not predetermined via high-throughput sequencing. The Clinical Proteomic Tumor Analysis Consortium (CPTAC), among with other public databases, has deposited a large amount of transcriptomic profiling data for numerous tumor types including that of glioblastoma @kim2024.

Comparitive profiling is the process of comparing expression levels of one sample against another (e.g. a diseased sample against a healthy sample) to identify and understand molecular causes of biological processes @altelaar2013. The differential analysis done in this thesis is a form of comparitive profiling.


== Gene Ontology <gene-ontology>

The Gene Ontology (GO) database provides structured and standardized representation of biological activities according to gene products,
organized into three main aspects: (1) Molecular Functions (MF), (2) Cellular Components (CC), and (3) Biological Processes (BP) @geneontology.

Gene Ontology enrichment analysis is commonly performed following differential expression analysis to determine whether particular GO terms — items belonging to each of the aforementioned aspects — are statistically overrepresented within a set of differentially expressed genes compared with a suitable background gene set instead of inspecting individual genes in isolation @ashburner2000 @yu2012. In the context of glioblastoma, GO enrichment provides insight into biological mechanisms associated with each molecular subtype.

Although all three GO ontologies provide complementary biological information, this thesis focuses primarily on the Biological Process ontology, as it describes coordinated cellular pathways and processes that can subsequently be related to regulated cell death signalling pathways.

== Regulated Cell Death Signaling Pathways <cell-death>

One of the main processes cells experience — especially after they have served their purpose — is programmed cell death, occuring via a complex cascade of molecular signaling. It keeps the bodily functions in check, and problems arise when this process is hindered or accelerated unexpectedly @clevelandclinic2023 @qian2024. The core types of programmed cell deaths are @qian2024: 
- *Apoptosis*: Regulated through intrinsic (mitochondrial) and extrinsic (death receptor) signalling pathways.
- *Autophagy*: Regulated through signalling pathways controlling lysosomal degradation and cellular recycling.
- *Necroptosis*: Initiated when death receptor signalling occurs while caspase-8 activity is inhibited, preventing apoptosis.
- *Pyroptosis*: Inflammatory programmed cell death driven by inflammasome signalling.
- *Ferroptosis*: Regulated by signalling pathways governing iron metabolism, lipid peroxidation, and cellular redox balance.

Each programmed cell death mode is regulated by a characteristic network of genes and proteins @qian2024. Consequently, differential expression of genes participating in these pathways can provide insight into alterations in the underlying signaling mechanisms. By integrating differentially expressed genes with Gene Ontology enrichment and curated cell death pathway gene sets, it becomes possible to identify which regulated cell death pathways are most strongly associated with each GBM molecular subtype.
