\name{heterozygosity}
\alias{heterozygosity}
\alias{heterozygosity.genocell}
\title{Homozygosity and Heterozygosity by Marker}
\description{
Counts, for each STR marker, the profiles that are homozygous,
heterozygous, missing, or with more than two alleles.
}
\usage{
heterozygosity(x, ...)
\method{heterozygosity}{genocell}(x, summary = TRUE, ...)
}
\arguments{
  \item{x}{an object of class \code{genocell}.}
  \item{summary}{logical. If \code{TRUE} (default), returns the counts by
  marker. If \code{FALSE}, returns the status of each profile.}
  \item{\dots}{further arguments (not used).}
}
\details{
For a given marker, a profile is homozygous when one allele is present,
missing (\code{Na}) when no allele is present, and heterozygous
otherwise. Profiles with more than two alleles (\code{mt2}) are also
counted as heterozygous. Loss of heterozygosity is frequent in cancer
cell lines and reduces the informativeness of STR markers (Bady et al.,
2012).
}
\value{
If \code{summary = TRUE}, a data frame with one row per marker and the
columns:
\item{homo}{number of homozygous profiles.}
\item{hetero}{number of heterozygous profiles.}
\item{Na}{number of profiles without allele.}
\item{mt2}{number of profiles with more than two alleles.}
\item{n}{\code{homo + hetero}.}
\item{N}{\code{homo + hetero + Na}.}
\item{Nallele}{number of distinct alleles of the marker.}
If \code{summary = FALSE}, a list with one logical matrix per marker
(profiles by \code{homo}, \code{hetero}, \code{Na}, \code{mt2}).
}
\references{
Bady, P. et al. (2012) DNA fingerprinting of glioma cell lines and
considerations on similarity measurements. \emph{Neuro-Oncology},
\bold{14}(6), 701--711. \doi{10.1093/neuonc/nos072}
}
\author{Pierre Bady}
\seealso{\code{\link{recode.STR2col}}}
\examples{
data(GliomaCL)
gcl <- recode.STR2col(GliomaCL$tab, GliomaCL$bloc, method = "binary")
het <- heterozygosity(gcl)
het
## proportion of homozygous profiles by marker
round(sort(het$homo / het$n, decreasing = TRUE), 2)
}
\keyword{manip}
