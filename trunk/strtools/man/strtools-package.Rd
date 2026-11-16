\name{strtools-package}
\alias{strtools-package}
\alias{strtools}
\docType{package}
\title{Tools for the Analysis of STR Fingerprinting Data}
\description{
Functions used to encode and compare short tandem repeat (STR) DNA
fingerprints of cell lines. They were written for the analysis of the
STR profiles of 39 glioma cell lines published in Bady et al. (2012).
}
\details{
A typical workflow is:
\enumerate{
  \item clean the raw allele calls with \code{\link{REspaceout}},
  \code{\link{REbracketout}} and \code{\link{REzeroout}};
  \item recode the STR table as an allele presence/absence table of class
  \code{genocell} with \code{\link{recode.STR2col}} (two columns per
  marker) or \code{\link{recode.STR1col}} (one column per marker);
  \item compare profiles with the Masters (EV) similarity index
  \code{\link{EVindex}};
  \item describe the markers with \code{\link{heterozygosity}};
  \item combine two panels with \code{\link[=merge.genocell]{merge}};
  \item study the behaviour of similarity scores under random allele
  sharing with \code{\link{simSIM.marker}} and \code{\link{simAIJ.marker}}.
}
Two data sets are provided: \code{\link{GliomaCL}} and \code{\link{NCI60}}.
}
\author{
Pierre Bady \email{badozor@gmail.com}
}
\references{
Bady, P., Diserens, A.-C., Castella, V., Kalt, S., Heinimann, K.,
Hamou, M.-F., Delorenzi, M. and Hegi, M.E. (2012) DNA fingerprinting of
glioma cell lines and considerations on similarity measurements.
\emph{Neuro-Oncology}, \bold{14}(6), 701--711.
\doi{10.1093/neuonc/nos072}
}
\keyword{package}
\examples{
data(GliomaCL)
gcl <- recode.STR2col(GliomaCL$tab, GliomaCL$bloc, method = "binary")
heterozygosity(gcl)
ev <- EVindex(gcl)
round(ev[1:5, 1:5], 2)
}
