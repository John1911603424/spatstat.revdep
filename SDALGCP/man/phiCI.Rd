% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/phiCI.R
\name{phiCI}
\alias{phiCI}
\title{Plot of the deviance to derive the confidence interval of of the scale parameter, phi}
\usage{
phiCI(obj, coverage = 0.95, plot = TRUE)
}
\arguments{
\item{obj}{object of class "SDALGCP" from the the call to function \link{SDALGCPMCML}}

\item{coverage}{the coverage probability, default is 0.95}

\item{plot}{logical, to plot the deviance curve. default is TRUE}
}
\value{
return the deviance plot and the corresponding confidence interval of the scale parameter phi
}
\description{
This function computes the confidence interval of phi
}
\details{
This function computes the confidence interval of phi
}
\seealso{
\link{SDALGCPMCML}
}
\author{
Olatunji O. Johnson \email{o.johnson@lancaster.ac.uk}

Emanuele Giorgi \email{e.giorgi@lancaster.ac.uk}

Peter J. Diggle \email{p.diggle@lancaster.ac.uk}
}
