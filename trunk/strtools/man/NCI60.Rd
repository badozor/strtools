\name{NCI60}
\alias{NCI60}
\docType{data}
\title{STR Fingerprints of NCI-60 Cell Lines}
\description{
STR DNA fingerprints (16 markers) of 62 cell lines of the NCI-60 panel.
Row names combine the tissue of origin and the cell line name (e.g.
\code{CNS:SF-268}).
}
\usage{data(NCI60)}
\format{
A list with two components:
\describe{
  \item{tab}{a data frame with 62 rows (cell lines) and 32 columns (two
  allele columns for each of the 16 markers).}
  \item{bloc}{a character vector of length 32 giving the marker of each
  column of \code{tab}.}
}
}
\details{
Markers: AMELO (amelogenin), CSF1PO, D13S317, D16S539, D18S51, D19S433,
D21S11, D2S1338, D3S1358, D5S818, D7S820, D8S1179, FGA, TH01, TPOX and
vWA. Marker names differ from \code{\link{GliomaCL}} for TH01 and vWA,
see the example of \code{\link{merge.genocell}}.
}
\examples{
data(NCI60)
head(NCI60$tab[, 1:6])
table(sub(":.*", "", rownames(NCI60$tab)))
}
\keyword{datasets}
