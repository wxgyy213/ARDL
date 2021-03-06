% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/uecm.R
\name{uecm}
\alias{uecm}
\alias{uecm.ardl}
\alias{uecm.default}
\title{Unrestricted ECM regression}
\usage{
uecm(...)

\method{uecm}{ardl}(object, ...)

\method{uecm}{default}(formula, data, order, start = NULL, end = NULL, ...)
}
\arguments{
\item{...}{Additional arguments to be passed to the low level regression
fitting functions.}

\item{object}{An object of \code{\link[base]{class}} 'ardl'.}

\item{formula}{A "formula" describing the linear model. Details for model
specification are given under 'Details'.}

\item{data}{A time series object (e.g., "ts", "zoo" or "zooreg") or a data
frame containing the variables in the model. In the case of a data frame,
it is coerced into a \code{\link[stats]{ts}} object with \code{start = 1},
\code{end = nrow(data)} and \code{frequency = 1}. If not found in data, the
variables are NOT taken from any environment.}

\item{order}{A specification of the order of the underlying ARDL model (e.g.,
for the UECM of an ARDL(1,0,2) model it should be \code{order = c(1,0,2)}).
A numeric vector of the same length as the total number of variables
(excluding the fixed ones, see 'Details'). It should only contain positive
integers or 0. An integer could be provided if all variables are of the
same order.}

\item{start}{Start of the time period which should be used for fitting the
model.}

\item{end}{End of the time period which should be used for fitting the model.}
}
\value{
\code{uecm} returns an object of \code{\link[base]{class}}
  \code{c("dynlm", "lm", "uecm")}. In addition, attributes 'order', 'data',
  'parsed_formula' and 'full_formula' are provided.
}
\description{
\code{uecm} is a generic function used to construct Unrestricted Error
Correction Models (UECM). The function invokes two different
\code{\link[utils]{methods}}. The default method works exactly like
\code{\link{ardl}}. The other method requires an object of
\code{\link[base]{class}} 'ardl'. Both methods create the conditional UECM,
which is the UECM of the underlying ARDL.
}
\details{
The \code{formula} should contain only variables that exist in the data
provided through \code{data} plus some additional functions supported by
\code{\link[dynlm]{dynlm}} (i.e., \code{trend()}).

You can also specify fixed variables that are not supposed to be lagged (e.g.
dummies etc.) simply by placing them after \code{|}. For example, \code{y ~
x1 + x2 | z1 + z2} where \code{z1} and \code{z2} are the fixed variables and
should not be considered in \code{order}. Note that the \code{|} notion
should not be confused with the same notion in \code{dynlm} where it
introduces instrumental variables.
}
\section{Mathematical Formula}{
 The formula of an Unrestricted ECM conditional
  to an \eqn{ARDL(p,q_{1},\dots,q_{k})}{ARDL(p,q1,...,qk)} is: \deqn{\Delta
  y_{t} = c_{0} + c_{1}t + \pi_{y}y_{t-1} + \sum_{j=1}^{k}\pi_{j}x_{j,t-1} +
  \sum_{i=1}^{p-1}\psi_{y,i}\Delta y_{t-i} +
  \sum_{j=1}^{k}\sum_{l=1}^{q_{j}-1} \psi_{j,l}\Delta x_{j,t-l} +
  \sum_{j=1}^{k}\omega_{j}\Delta x_{j,t} + \epsilon_{t}}
}

\examples{
data(denmark)

## Estimate the UECM, conditional to it's underlying ARDL(3,1,3,2) -----

# Indirectly
ardl_3132 <- ardl(LRM ~ LRY + IBO + IDE, data = denmark, order = c(3,1,3,2))
uecm_3132 <- uecm(ardl_3132)

# Directly
uecm_3132_ <- uecm(LRM ~ LRY + IBO + IDE, data = denmark, order = c(3,1,3,2))
identical(uecm_3132, uecm_3132_)
summary(uecm_3132)
}
\seealso{
\code{\link{ardl}} \code{\link{recm}}
}
\author{
Kleanthis Natsiopoulos, \email{klnatsio@gmail.com}
}
\keyword{models}
\keyword{ts}
