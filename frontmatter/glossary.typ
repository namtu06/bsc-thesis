/** glossary.typ
 *
 * Write the glossary (sanasto) of your work here, into the typst
 * [dictionary] glossary_words. Each entry in the dictionary
 * needs to contain the keys name and description. The glossary
 * will be sorted according to the entry keys.
 *
 * [dictionary]: https://typst.app/docs/reference/foundations/dictionary/
 *
***/

#import "../preamble.typ": *

#let glossary_words = (
	glioblastoma: (
		name: "GBM",
		description: [
			Glioblastoma multiforme, the most aggressive form of brain tumors.
		]
	),
	DEGs: (
		name: "DEG",
		description: [
	
			 (Significantly) differentially expressed gene.
		]
	),
	gene: (
		name: emph[EGFR],
		description: [
			Italic words denote genes.
		]
	),
	oxphos: (
		name: "OXPHOS",
		description: [
			Oxidative phosphorylation, the driver of mitochondrial respiration.
		]
	),

	apoptosis: (
		name: "Apoptosis",
		description: [
			A major form of programmed cell death, closely connected to the mitochondria
		]
	)
)
