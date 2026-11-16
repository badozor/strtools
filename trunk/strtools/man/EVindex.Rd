\name{EVindex}
\alias{EVindex}
\title{Masters (EV) Similarity Index between STR Profiles}
\description{
Computes the similarity index of Masters et al. (2001), also called EV
score, between STR profiles coded as allele presence/absence. The index
is the Dice-Sorensen coefficient \eqn{2a/(2a + b + c)}, where \eqn{a} is
the number of shared alleles and \eqn{b} and \eqn{c} the numbers of
alleles present in only one of the two profiles.
}
\usage{
EVindex(x, y = NULL, ...)
}
\arguments{
  \item{x}{a data frame or a matrix of non-negative values, rows are
  profiles (cell lines) and columns are alleles, typically an object of
  class \code{genocell}. Positive values are treated as presence.}
  \item{y}{an optional second data frame or matrix with the same columns
  as \code{x}. If \code{NULL}, similarities are computed between the rows
  of \code{x}.}
  \item{\dots}{further arguments (not used).}
}
\details{
The function is based on \code{\link[ade4]{dist.binary}} (method 5) of
the \pkg{ade4} package, but returns similarities instead of distances,
including the diagonal. Missing values are not handled: remove profiles
with missing alleles beforehand.
}
\value{
A data frame of similarities in [0, 1]. Without \code{y}, a square table
with the row names of \code{x} as row and column names. With \code{y}, a
table with \code{nrow(x)} rows and \code{nrow(y)} columns.
}
\references{
Masters, J.R., Thomson, J.A., Daly-Burns, B., et al. (2001) Short tandem
repeat profiling provides an international reference standard for human
cell lines. \emph{PNAS}, \bold{98}(14), 8012--8017.
\doi{10.1073/pnas.121616198}

Bady, P. et al. (2012) DNA fingerprinting of glioma cell lines and
considerations on similarity measurements. \emph{Neuro-Oncology},
\bold{14}(6), 701--711. \doi{10.1093/neuonc/nos072}
}
\author{Pierre Bady}
\seealso{\code{\link[ade4]{dist.binary}}, \code{\link{recode.STR2col}}}
\examples{
data(GliomaCL)
gcl <- recode.STR2col(GliomaCL$tab, GliomaCL$bloc, method = "binary")
ev <- EVindex(gcl)
round(ev[1:5, 1:5], 2)

## pairs of cell lines with a score >= 0.8
w <- as.matrix(ev)
w[upper.tri(w, diag = TRUE)] <- NA
which(w >= 0.8, arr.ind = TRUE)

## similarity between two subsets
EVindex(gcl[1:3, ], gcl[4:6, ])

## equivalence with ade4::dist.binary (method 5)
d <- as.matrix(dist.binary(gcl, method = 5))
all.equal(unname(1 - d^2)[upper.tri(d)], unname(as.matrix(ev))[upper.tri(d)])
}
\keyword{multivariate}
