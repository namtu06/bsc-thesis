#import "../preamble.typ": *

= Research methodology <methodology>
Both transcriptome and proteome data was obtained from CPTAC GBM Discovery Study dataset, given as already-normalized (but not yet $log_2$-transformed) expression values according to their originating gene.

Transcriptomic and proteomic expression values typically span several orders of magnitude and exhibit right-skewed distributions.
Therefore, a common practice when working with expression matrices, which has been done to the current data, is to apply a $log_2$-transformation @law2014 @cox2014. 
An example expression value matrix ready for calculation is given in Table 1.

#show table.cell.where(y: 0): strong
#figure(
    table(
        columns: 5,
        stroke: none,
        align: center + horizon,
        table.header([Gene],table.vline(),[Sample 1],table.vline(),[Sample 2],table.vline(),[Sample 3],table.vline(),[...]),
        table.hline(),
        [A1BG], num(18.833), num(18.647),num(18.958),[...],
        [SPC25], num(13.475), num(13.469),num(13.786),[...],
        [...],[...],[...],[...],[...]
    ),
    caption: [Example expression matrix]
)
== Performing differential analysis

