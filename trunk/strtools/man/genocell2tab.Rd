\name{genocell2tab}
\alias{genocell2tab}
\title{Convert a genocell Object Back to a Table of Allele Calls}
\description{
Rebuilds a table with one column per marker, each cell listing the
alleles present in the profile.
}
\usage{
genocell2tab(x, markers = NULL, sep = ",", ...)
}
\arguments{
  \item{x}{an object of class \code{genocell}.}
  \item{markers}{an optional character vector of markers to keep.}
  \item{sep}{the separator placed between alleles.}
  \item{\dots}{further arguments (not used).}
}
\details{
Alleles are sorted as character strings, so that \code{"11"} comes
before \code{"9"}.
}
\value{
A data frame with one row per profile and one column per marker.
}
\author{Pierre Bady}
\seealso{\code{\link{recode.STR1col}}, \code{\link{recode.STR2col}}}
\examples{
data(GliomaCL)
gcl <- recode.STR2col(GliomaCL$tab, GliomaCL$bloc, method = "binary")
head(genocell2tab(gcl, markers = c("AMELO", "D5S818", "TPOX")))
}
\keyword{manip}
