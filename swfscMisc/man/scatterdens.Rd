% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scatterdens.R
\name{scatterdens}
\alias{scatterdens}
\alias{scatterhist}
\title{Scatter Plot with Density Margins}
\usage{
scatterdens(x, y, dens.frac = 1/5, ...)

scatterhist(x, y, xlab = "", ylab = "", dens.frac = 1/5, ...)
}
\arguments{
\item{x, y}{vectors of points to plot.}

\item{dens.frac}{fraction of screen to be taken up by density plots on margins.}

\item{...}{Arguments to be passed to \link{plot}.}

\item{xlab, ylab}{labels for x and y axes.}
}
\description{
Produce a scatter plot with a histogram or density plot in 
  the margins
}
\examples{
x <- rnorm(100)
y <- rlnorm(100)
op <- par(ask = TRUE)
scatterdens(x, y, xlab = "x", ylab = "y")
par(op)

}
\references{
Original code by Ken Kleiman: \url{http://sas-and-r.blogspot.co.uk/2011/06/example-841-scatterplot-with-marginal.html}
}
\author{
Eric Archer \email{eric.archer@noaa.gov}
}
