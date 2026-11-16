\name{simSIM.marker}
\alias{simSIM.marker}
\alias{simSIM2.marker}
\alias{simSIM3.marker}
\alias{simSIM4.marker}
\alias{simSIM4plus.marker}
\title{Simulation of Similarity Scores between STR Profiles}
\description{
Simulates the distribution of similarity scores between two unrelated
STR profiles, for a given number of markers. Used to study how the
similarity score, and the usual 0.8 cutoff, depend on the number of
markers (Bady et al., 2012).
}
\usage{
simSIM.marker(marker = 9, R = 999)
simSIM2.marker(marker = 9, R = 999)
simSIM3.marker(marker = 9, R = 999)
simSIM4.marker(marker = 8, R = 999)
simSIM4plus.marker(marker = 9, R = 999, nrep = 999)
}
\arguments{
  \item{marker}{the number of STR markers.}
  \item{R}{the number of simulations (for \code{simSIM4.marker}, the
  number of permutations of the test).}
  \item{nrep}{the number of permutations of each test run by
  \code{simSIM4plus.marker}.}
}
\details{
For each simulation, the numbers of alleles \eqn{x_1} and \eqn{x_2} of
two profiles are drawn uniformly between \code{marker} and
\code{2 * marker}, and the number of shared alleles \eqn{a} is drawn as
in \code{\link{simAIJ.marker}}. The functions then return:
\describe{
  \item{\code{simSIM.marker}}{the Masters (EV) score
  \eqn{2a/(x_1 + x_2)}, see \code{\link{EVindex}};}
  \item{\code{simSIM2.marker}}{the Jaccard score
  \eqn{a/(x_1 + x_2 - a)};}
  \item{\code{simSIM3.marker}}{the number of shared alleles \eqn{a};}
  \item{\code{simSIM4.marker}}{a Monte Carlo test of one simulated
  \eqn{a} against \code{R} values simulated by
  \code{\link{simAIJ.peak}};}
  \item{\code{simSIM4plus.marker}}{the p-values of \code{R} such tests.}
}
}
\value{
\code{simSIM.marker}, \code{simSIM2.marker}, \code{simSIM3.marker} and
\code{simSIM4plus.marker} return a numeric vector of length \code{R}.
\code{simSIM4.marker} returns an object of class \code{randtest}
(\pkg{ade4}).
}
\references{
Bady, P. et al. (2012) DNA fingerprinting of glioma cell lines and
considerations on similarity measurements. \emph{Neuro-Oncology},
\bold{14}(6), 701--711. \doi{10.1093/neuonc/nos072}
}
\author{Pierre Bady}
\seealso{\code{\link{simAIJ.marker}}, \code{\link{EVindex}},
\code{\link[ade4]{as.randtest}}}
\examples{
set.seed(1)
## EV score for 9 and 16 markers
s9 <- simSIM.marker(marker = 9, R = 999)
s16 <- simSIM.marker(marker = 16, R = 999)
## upper quantiles of the simulated scores
quantile(s9, c(0.5, 0.95, 0.99))
quantile(s16, c(0.5, 0.95, 0.99))

## Jaccard score and number of shared alleles
summary(simSIM2.marker(marker = 9, R = 199))
table(simSIM3.marker(marker = 9, R = 199))

## Monte Carlo test
simSIM4.marker(marker = 8, R = 199)
summary(simSIM4plus.marker(marker = 8, R = 20, nrep = 99))
}
\keyword{datagen}
