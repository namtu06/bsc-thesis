#import "../preamble.typ": *

= Theoretical Background <background>

== Glioblastoma biology <glioblastoma>

Glioblastoma multiforme is one of the most aggressive and most common form of brain tumors, with an extremely poor prognosis of a median survival period of 12-15 months @lemee2018 @singh2022. GBM possesses an extreme heterogeneity in its structure which results in its resistance to conventional therapies and high recurrence rate @singh2022. 

Advanced sequencing technologies emphasizes the need for therapies to target both molecular drivers of the tumors and their arised microenvironment; one of the promising path to battle GBM involves precision medicine, leveraging computational methods for targeted therapy selection and resistance prediction @singh2022. 

== Transcriptomics and proteomics <multiomics>

Transcriptomics technologies obtains information on how genes are expressed an organism's DNA by looking through all the RNA transcripts produced from the DNA @crick1970 @lowe2017. According to Lowe et al. @lowe2017, there are two main ways of approaching the reading of RNA, including (1) quantifying predetermined sequences with microarrays, and (2) using RNA sequencing (RNA-seq) which also identifies sequences that were not predetermined via high-throughput sequencing.

Based on current literature @altelaar2013 @crick1970, proteomics is the analysis of the protein content of an organism which is a far more complex area of the central dogma to analyze due to alternative splicing and diverse modications and degradation of proteins, in combination with various other factors; but thanks to recent advancements in technologies, identification and quantification of proteins is now possible on a single-experiment basis. Altelaar et al. @altelaar2013 stated that protein quantification typically can be done based on their mass through a process called mass-spectrometry, but a variety of other methods can also be performed based on the research's goal. 

Comparitive profiling, which can be performed both in transcriptomics and proteomics, is the process of comparing expression levels of one sample against another (e.g. a diseased sample against a healthy sample) to identify and understand molecular causes of biological processes @altelaar2013. The differential analysis done in this thesis is a form of comparitive profiling.

The term _multiomics_ is often used to refer to research combining biotechnology ending with the "-omics" suffix, such as the aforementioned transcriptomics and proteomics @luo2024.

== Multiomics profiling in glioblastoma <glio-omics>

As per Lemée et al. @lemee2018, computational research in GBM has until very recently been done through independent analyses of transciptomes and proteomes. However, joint research comnbining the two shows promises of new biological insights, despite the fact that there still exists a discrepancy regarding expression values and simply labelling a correlation coefficient generalizes the relationship too much @lemee2018 @kim2024. 
According to Lemée et al., other ways of approaching the transcriptome-proteome discepancy include (possible identification and) the inspection of: (1) the overlapping of transcriptome and proteome data, (2) altered common biological pathways in both datasets, (3) altered common functional pathways in both datasets, ... @lemee2018

The Clinical Proteomic Tumor Analysis Consortium (CPTAC), among with other public databases, has deposited a large amount of proteogenomic profiling data for numerous tumor types including that of glioblastoma @kim2024. More specialized data regarding transcriptomics can also be obtained at the public database Gene Expression Omnibus (GEO).


== Regulated Cell Death Signaling Pathways <cell-death>

One of the main processes cells experience — especially after they have served their purpose — is programmed cell death, occuring via a complex cascade of molecular signaling. It keeps the bodily functions in check, and problems arise when this process is hindered or accelerated unexpectedly @clevelandclinic2023 @qian2024. The core types of programmed cell deaths are @qian2024: 
- *Apoptosis*: Regulated through intrinsic (mitochondrial) and extrinsic (death receptor) signalling pathways.
- *Autophagy*: Regulated through signalling pathways controlling lysosomal degradation and cellular recycling.
- *Necroptosis*: Initiated when death receptor signalling occurs while caspase-8 activity is inhibited, preventing apoptosis.
- *Pyroptosis*: Inflammatory programmed cell death driven by inflammasome signalling.
- *Ferroptosis*: Regulated by signalling pathways governing iron metabolism, lipid peroxidation, and cellular redox balance.

Each programmed cell death mode is regulated by a characteristic network of genes and proteins @qian2024. Consequently, differential expression of genes participating in these pathways can provide insight into alterations in the underlying signaling mechanisms. By integrating differentially expressed genes with Gene Ontology enrichment and curated cell death pathway gene sets, it becomes possible to identify which regulated cell death pathways are most strongly associated with each GBM molecular subtype.