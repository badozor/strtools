\name{REclean}
\alias{REclean}
\alias{REbracketout}
\alias{REspaceout}
\alias{REzeroout}
\title{Clean Raw Allele Calls}
\description{
Helpers based on regular expressions to clean allele calls before
recoding.
\code{REbracketout} removes round brackets,
\code{REspaceout} removes spaces and
\code{REzeroout} removes a trailing \code{.0} (e.g. \code{"12.0"}
becomes \code{"12"}).
}
\usage{
REbracketout(x, replaceby = "", ...)
REspaceout(x, replaceby = "", ...)
REzeroout(x, replaceby = "", ...)
}
\arguments{
  \item{x}{a character vector (or an object coercible to character).}
  \item{replaceby}{the replacement string.}
  \item{\dots}{further arguments (not used).}
}
\value{
A character vector, named by the original values.
}
\author{Pierre Bady}
\seealso{\code{\link{recode.STR1col}}, \code{\link{recode.STR2col}}}
\examples{
REbracketout(c("12(13)", "9"))
REspaceout(c("LN-18 ", "U87MG"))
REzeroout(c("12.0", "9.3", "10.0,11"))

## clean the row names of GliomaCL
data(GliomaCL)
unname(REspaceout(rownames(GliomaCL$tab)))
}
\keyword{character}
