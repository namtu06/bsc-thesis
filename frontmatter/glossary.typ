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
			Glioblastoma multiforme
		]
	),
	DEGs: (
		name: "DEG",
		description: [
	
			 (Significantly) differentially expressed genes
		]
	),
	gene: (
		name: emph[EGFR],
		description: [
			Italic words denote genes
		]
	),

)
