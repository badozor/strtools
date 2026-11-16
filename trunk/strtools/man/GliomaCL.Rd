\name{GliomaCL}
\alias{GliomaCL}
\docType{data}
\title{STR Fingerprints of 39 Glioma Cell Lines}
\description{
Standard 16 marker STR DNA fingerprints of a panel of 39 widely used
glioma cell lines, published as reference in Bady et al. (2012).
}
\usage{data(GliomaCL)}
\format{
A list with two components:
\describe{
  \item{tab}{a data frame with 39 rows (cell lines) and 32 columns (two
  allele columns for each of the 16 markers).}
  \item{bloc}{a character vector of length 32 giving the marker of each
  column of \code{tab}.}
}
}
\details{
Markers: D3S1358, THO1, D21S11, D18S51, PENTAE, D5S818, D13S317, D7S820,
D16S539, CSF1PO, PENTAD, AMELO (amelogenin), VWA, D8S1179, TPOX and FGA.
Homozygous alleles are reported in both columns. Some row names contain
trailing spaces, see \code{\link{REspaceout}}.
}
\source{
Bady, P., Diserens, A.-C., Castella, V., Kalt, S., Heinimann, K.,
Hamou, M.-F., Delorenzi, M. and Hegi, M.E. (2012) DNA fingerprinting of
glioma cell lines and considerations on similarity measurements.
\emph{Neuro-Oncology}, \bold{14}(6), 701--711.
\doi{10.1093/neuonc/nos072}
}
\examples{
data(GliomaCL)
head(GliomaCL$tab[, 1:6])
table(GliomaCL$bloc)
}
\keyword{datasets}
