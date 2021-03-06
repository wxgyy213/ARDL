% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/crit_val_bounds_sim.R
\name{vcov_custom}
\alias{vcov_custom}
\title{Variance-Covariance matrix of a regression}
\usage{
vcov_custom(indep_vars, model_res)
}
\arguments{
\item{indep_vars}{A matrix representing the independent variables.}

\item{model_res}{A numeric vector representing the regression's residuals.}
}
\value{
\code{vcov_custom} returns a Variance-Covariance matrix.
}
\description{
\code{vcov_custom} creates the Variance-Covariance matrix of a regression. It
is used instead of the \code{\link[stats]{vcov}} because the latter doesn't
work with \code{\link[stats]{.lm.fit}}.
}
\seealso{
\code{\link{f_test_custom}} \code{\link{f_bounds_sim}}
  \code{\link{t_bounds_sim}}
}
\author{
Kleanthis Natsiopoulos, \email{klnatsio@gmail.com}
}
\keyword{internal}
