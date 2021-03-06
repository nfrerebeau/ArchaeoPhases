% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/AllGenerics.R, R/plot.R
\docType{methods}
\name{plot}
\alias{plot}
\alias{plot-method}
\alias{plot,MCMC,missing-method}
\alias{plot,PhasesMCMC,missing-method}
\title{Plot}
\usage{
\S4method{plot}{MCMC,missing}(
  x,
  calendar = c("BCAD", "BP"),
  density = TRUE,
  n = 512,
  interval = c("ci", "hpdi"),
  level = 0.95,
  decreasing = TRUE,
  elapsed = FALSE,
  origin = 1,
  ...
)

\S4method{plot}{PhasesMCMC,missing}(
  x,
  calendar = c("BCAD", "BP"),
  level = 0.95,
  n = 512,
  decreasing = TRUE,
  elapsed = FALSE,
  origin = 1,
  succession = is_ordered(x),
  ...
)
}
\arguments{
\item{x}{An \code{\linkS4class{MCMC}} or a \code{\linkS4class{PhasesMCMC}} object.}

\item{calendar}{A \code{\link{character}} string specifying whether the dates
should be displayed in BP or BC/AD. It must be one of "\code{BCAD}" (the default)
or "\code{BP}". Any unambiguous substring can be given.}

\item{density}{A \code{\link{logical}} scalar: should estimated density be plotted?}

\item{n}{An \code{\link{integer}} specifying the number of equally spaced points at
which the density is to be estimated (should be a power of two). Only used
if \code{density} is \code{TRUE}.}

\item{interval}{A \code{\link{character}} string specifying the confidence interval to
be drawn. It must be one of "\code{ci}" (credible interval; the default)
or "\code{hpdi}" (highest posterior density interval). Any unambiguous substring
can be given.}

\item{level}{A length-one \code{\link{numeric}} vector giving the confidence level.}

\item{decreasing}{A \code{\link{logical}} scalar: should the sort order be decreasing?}

\item{elapsed}{A \code{\link{logical}} scalar: should an elapsed time scale be used?}

\item{origin}{A length-one \code{\link{numeric}} vector giving the position of the
column corresponding to the event from which elapsed time is calculated.
Only used if \code{elapsed} is \code{TRUE}.}

\item{...}{Extra parameters to be passed to \code{\link[stats:density]{stats::density()}}.}

\item{succession}{A \code{\link{logical}} scalar: should time ranges be plotted instead
of densities?}
}
\description{
Plot
}
\section{Methods (by class)}{
\itemize{
\item \code{x = MCMC,y = missing}: Plots of credible intervals or HPD regions of a series of
events.

\item \code{x = PhasesMCMC,y = missing}: Plots the characteristics of a group of events (phase).
}}

\examples{
## Coerce to MCMC
events <- as_mcmc(Events, iteration = 1)
summary(events)

zz <- BCAD_to_BP(events)

## Plot events
plot(events, interval = "ci", calendar = "BCAD")
plot(events, interval = "hpdi", calendar = "BC")

## Compute phases
phases <- phase(events, groups = list(A = c(2, 4), B = c(1, 3)), ordered = TRUE)
summary(phases)

## Plot phases
plot(phases, succession = FALSE, calendar = "BCAD")
plot(phases, succession = TRUE, calendar = "BP")
}
\seealso{
\code{\link[stats:density]{stats::density()}}
}
\author{
A. Philippe, M.-A. Vibet, T. S. Dye, N. Frerebeau
}
\concept{plot}
