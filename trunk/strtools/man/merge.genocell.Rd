\name{merge.genocell}
\alias{merge.genocell}
\title{Merge Two genocell Objects}
\description{
Stacks the profiles of two \code{genocell} objects on their common
markers, taking the union of the alleles of each marker.
}
\usage{
\method{merge}{genocell}(x, y, ...)
}
\arguments{
  \item{x, y}{two objects of class \code{genocell}.}
  \item{\dots}{further arguments (not used).}
}
\details{
Only markers present in both objects, with exactly the same name, are
kept. Check marker names first (e.g. \code{TH01} versus \code{THO1},
\code{vWA} versus \code{VWA}). Alleles absent from one object are coded
0 for its profiles.
}
\value{
An object of class \code{genocell} with \code{nrow(x) + nrow(y)} rows,
and an extra attribute \code{indica} equal to 1 for the rows of
\code{x} and 2 for the rows of \code{y}.
}
\author{Pierre Bady}
\seealso{\code{\link{recode.STR2col}}, \code{\link{EVindex}}}
\examples{
data(GliomaCL)
data(NCI60)
## harmonise marker names before recoding
blocG <- toupper(sub("THO1", "TH01", GliomaCL$bloc))
blocN <- toupper(NCI60$bloc)
gcl <- recode.STR2col(GliomaCL$tab, blocG, method = "binary")
nci <- recode.STR2col(NCI60$tab, blocN, method = "binary")
both <- merge(gcl, nci)
dim(both)
table(attr(both, "indica"))
## similarity between glioma and NCI-60 cell lines
ev <- EVindex(both[attr(both, "indica") == 1, ],
    both[attr(both, "indica") == 2, ])
max(ev)
}
\keyword{manip}
