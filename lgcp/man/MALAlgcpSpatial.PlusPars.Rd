% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/SpatialOnlyPlusParameters.R
\name{MALAlgcpSpatial.PlusPars}
\alias{MALAlgcpSpatial.PlusPars}
\title{MALAlgcpSpatial.PlusPars function}
\usage{
MALAlgcpSpatial.PlusPars(
  mcmcloop,
  inits,
  adaptivescheme,
  M,
  N,
  Mext,
  Next,
  mcens,
  ncens,
  formula,
  Zmat,
  model.priors,
  model.inits,
  fftgrid,
  spatial.covmodel,
  nis,
  cellarea,
  spatialvals,
  cellInside,
  MCMCdiag,
  gradtrunc,
  gridfun,
  gridav,
  d
)
}
\arguments{
\item{mcmcloop}{details of the mcmc loop}

\item{inits}{initial values}

\item{adaptivescheme}{the adaptive MCMC scheme}

\item{M}{number of grid cells in x direction}

\item{N}{number of grid cells in y direction}

\item{Mext}{number of extended grid cells in x direction}

\item{Next}{number of extended grid cells in y direction}

\item{mcens}{centroids in x direction}

\item{ncens}{centroids in y direction}

\item{formula}{a formula object of the form X ~ var1 + var2 etc.}

\item{Zmat}{design matrix constructed using getZmat}

\item{model.priors}{model priors, constructed using lgcpPrior}

\item{model.inits}{initial values for the MCMC}

\item{fftgrid}{an objects of class FFTgrid, see genFFTgrid}

\item{spatial.covmodel}{spatial covariance model, consructed with CovFunction}

\item{nis}{cell counts on the etended grid}

\item{cellarea}{the cell area}

\item{spatialvals}{inerpolated poisson offset on fft grid}

\item{cellInside}{0-1 matrix indicating inclusion in the observation window}

\item{MCMCdiag}{not used}

\item{gradtrunc}{gradient truncation parameter}

\item{gridfun}{used to specify other actions to be taken, e.g. dumping MCMC output to disk.}

\item{gridav}{used for computing Monte Carlo expectations online}

\item{d}{matrix of toral distances}
}
\value{
output from the MCMC run
}
\description{
A function to run the MCMC algorithm for spatial point process data. Not for general purpose use.
}
