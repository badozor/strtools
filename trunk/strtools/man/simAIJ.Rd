\name{simAIJ}
\alias{simAIJ}
\alias{simAIJ.marker}
\alias{simAIJ.peak}
\title{Simulation of the Number of Shared Alleles}
\description{
Simulates the number of alleles shared by chance between two STR
profiles.
}
\usage{
simAIJ.marker(marker = 8, R = 10)
simAIJ.peak(peak, R = 10)
}
\arguments{
  \item{marker}{the number of STR markers.}
  \item{peak}{the number of alleles (peaks) that can be shared.}
  \item{R}{the number of simulations.}
}
\details{
In \code{simAIJ.marker}, the number of alleles of each profile is drawn
uniformly between \code{marker} (all markers homozygous) and
\code{2 * marker} (all markers heterozygous). Each of the
\code{min(x1, x2)} alleles that could be shared is then shared with
probability 1/2. In \code{simAIJ.peak}, the number of alleles that can
be shared is fixed to \code{peak}.
}
\value{
An integer vector of length \code{R}, the simulated numbers of shared
alleles.
}
\references{
Bady, P. et al. (2012) DNA fingerprinting of glioma cell lines and
considerations on similarity measurements. \emph{Neuro-Oncology},
\bold{14}(6), 701--711. \doi{10.1093/neuonc/nos072}
}
\author{Pierre Bady}
\seealso{\code{\link{simSIM.marker}}}
\examples{
set.seed(1)
table(simAIJ.marker(marker = 8, R = 999))
summary(simAIJ.peak(peak = 16, R = 999))
}
\keyword{datagen}
