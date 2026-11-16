\name{recode.STR}
\alias{recode.STR}
\alias{recode.STR1col}
\alias{recode.STR2col}
\alias{prep.fuzzy.genocell}
\alias{genocell}
\title{Encoding of STR Fingerprinting Data}
\description{
\code{recode.STR2col} and \code{recode.STR1col} recode a table of STR
allele calls into an allele table of class \code{genocell}, with one
column per observed allele of each marker. \code{prep.fuzzy.genocell}
turns a \code{genocell} object into a fuzzy coded table (profiles by
marker sum to 1).
}
\usage{
recode.STR1col(df, sep = ",", method = "fuzzy", ...)
recode.STR2col(df, bloc, sep = "[-]", method = "fuzzy", ...)
prep.fuzzy.genocell(x, ...)
}
\arguments{
  \item{df}{a data frame of allele calls, rows are profiles (cell lines).
  For \code{recode.STR1col}, one column per marker, with the alleles of a
  marker in one cell separated by \code{sep} (e.g. \code{"12,13"}). For
  \code{recode.STR2col}, several columns per marker (usually two, one per
  allele), as defined by \code{bloc}.}
  \item{bloc}{a vector (character or factor) of length \code{ncol(df)}
  giving the marker of each column of \code{df}.}
  \item{sep}{a regular expression used to split the content of a cell
  into alleles.}
  \item{method}{the coding of the alleles: \code{"fuzzy"} (default)
  counts the occurrences of each allele, so that a homozygous allele
  reported in both columns is coded 2; \code{"binary"} codes presence
  (1) or absence (0).}
  \item{x}{an object of class \code{genocell}.}
  \item{\dots}{further arguments passed to
  \code{\link[ade4]{prep.fuzzy.var}} (\code{prep.fuzzy.genocell}) or not
  used.}
}
\details{
Allele columns are named \code{marker.allele} (e.g. \code{D5S818.12}).
Alleles are kept as character strings, so that micro-variants such as
\code{9.3} or amelogenin alleles \code{X} and \code{Y} are handled. Cells
are converted with \code{as.character}; clean them first with
\code{\link{REspaceout}}, \code{\link{REbracketout}} or
\code{\link{REzeroout}} if needed (e.g. \code{"12.0"} and \code{"12"}
would be two different alleles).
}
\value{
\code{recode.STR1col} and \code{recode.STR2col} return a data frame of
class \code{c("genocell", "data.frame")} with three attributes:
\item{bloc}{a named integer vector, the number of alleles of each marker.}
\item{fac}{a factor giving the marker of each column.}
\item{levels}{a character vector giving the allele of each column.}
\code{prep.fuzzy.genocell} returns the data frame produced by
\code{\link[ade4]{prep.fuzzy.var}}.
}
\references{
Chevenet, F., Dolédec, S. and Chessel, D. (1994) A fuzzy coding approach
for the analysis of long-term ecological data. \emph{Freshwater Biology},
\bold{31}, 295--309.

Bady, P. et al. (2012) DNA fingerprinting of glioma cell lines and
considerations on similarity measurements. \emph{Neuro-Oncology},
\bold{14}(6), 701--711. \doi{10.1093/neuonc/nos072}
}
\author{Pierre Bady}
\seealso{
\code{\link{genocell2tab}}, \code{\link{EVindex}},
\code{\link{heterozygosity}}, \code{\link[ade4]{prep.fuzzy.var}}
}
\examples{
## two columns per marker
data(GliomaCL)
head(GliomaCL$tab[, 1:6])
gcl <- recode.STR2col(GliomaCL$tab, GliomaCL$bloc, method = "binary")
dim(gcl)
attr(gcl, "bloc")
gcl[1:3, 1:6]

## one column per marker
df1 <- data.frame(D5S818 = c("11,12", "12"), TH01 = c("6,9.3", "7"),
    row.names = c("cell1", "cell2"))
recode.STR1col(df1, method = "binary")

## fuzzy coding and fuzzy correspondence analysis (ade4)
fz <- prep.fuzzy.genocell(gcl)
fca <- dudi.fca(fz, scannf = FALSE, nf = 2)
head(fca$li)
}
\keyword{manip}
