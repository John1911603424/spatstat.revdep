\name{getis}
\alias{getis}
\alias{plot.ecespa.getis}
\alias{print.ecespa.getis}
\title{ Neighbourhood density function }
\description{
  Computes and plots the neighbourhood density function, a local version of the \eqn{K}-function defined by Getis and Franklin (1987). 
}
\usage{
getis(mippp, nx = 30, ny = 30, R = 10)

\method{plot}{ecespa.getis}(x, type="k", dimyx=NULL, xy=NULL, eps=NULL,  color=NULL,
         contour=TRUE, points=TRUE,...)
}
\arguments{
  \item{mippp}{A point pattern. An object with the \code{\link[spatstat.geom]{ppp}} format of \code{spatstat}. }
  \item{nx}{Grid dimensions (for estimation) in the x-side. }
  \item{ny}{Grid dimensions (for estimation) in the y-side. }
  \item{R}{Radius. The distance argument \emph{ r} at which the function \eqn{K} should be computed. }
  
  \item{x}{Result of applying \code{getis} to a point pattern. }
  \item{type}{Type of local statistics to be ploted. One of \code{k} (local-\eqn{K}), \code{l} (local-\eqn{L}), \code{n} (local-\eqn{n}) or \code{d} (deviations from CSR).}
  
 \item{color}{A list of colors such as that generated by \code{\link{rainbow}}, \code{\link{heat.colors}}, \code{\link{topo.colors}}, \code{\link{terrain.colors}} or similar functions.}
  
  \item{dimyx}{pixel array dimensions, will be passed to (i.e. see details in) \code{\link[spatstat.geom]{as.mask}}.}
  \item{xy}{pixel coordinates, will be passed to (i.e. see details in) \code{\link[spatstat.geom]{as.mask}}.}
  \item{eps}{width and height of pixels, will be passed to (i.e. see details in) \code{\link[spatstat.geom]{as.mask}}.}
  \item{contour}{Logical; if TRUE, add a contour to current plot.}
  \item{points}{Logical; if TRUE, add the point pattern to current plot.}
  \item{\dots}{ Additional graphical parameters passed to \code{link{plot}}. }
}
\details{
  Getis and Franklin (1987) proposed the neigbourhood density function, a local version of Ripley's \eqn{L}- function.
 Given a spatial point pattern \eqn{X}, the neigbourhood density function associated with the \emph{i}th point in \eqn{X} is computed by

\deqn{L[i](r) = sqrt((a/((n-1))*pi))*sum[j]e[i,j])}
where the sum is over all points \emph{ j != i} that lie within a distance \emph{r} of the \emph{i}th point, \emph{a} is the area of the observation window,
\emph{n} is the number of points in \eqn{X}, and \emph{e[i,j]} is the isotropic edge correction term (as described in \code{\link[spatstat.core]{Kest}}). The value of \emph{L[i](r)} can also
 be interpreted as one of the summands that contributes to the global estimate of the \eqn{L}-function. 

The command \code{getis} actually computes the local \eqn{K}-function using \code{\link[spatstat.core]{Kcross}}. As the main objective of \code{getis} is to map the local density function,  
as sugested by Gestis and Franklin (1987: 476) a grid of  points (whose density is controled by \code{nx} and \code{ny}),  is used to accurately estimate the
functions in empty or sparse areas. The S3 method  \code{plot.ecespa.getis}  plots the spatial distribution of  the local \eqn{K} or \eqn{L} function or other related local statistics, such as 
\eqn{n[i](r)}, the number of neighbor points [=\eqn{ lambda*K[i](r)}]  or the deviations from  the expected value of  local  \eqn{L}  under CSR [= \eqn{L[i](r) -r}].  It some of the arguments \code{dimyx}, \code{xy} or \code{eps} is provided it will use the function 
\code{\link[spatstat.geom]{interp.im}} in \code{spatstat} package to interpolate the results;otherwise it will plot the estimated values at the origial grid points. 

}
\value{
  \code{getis} gives an object of class \code{ecespa.getis}, bassically a list with the following elements:
  \item{x }{x coordinates of pattern points (ahead) and grid points.}
  \item{y }{y coordinates of pattern points (ahead) and grid points.}
  \item{klocal }{Estimate of local \eqn{K[i](r)} at the point pattern points.}
  \item{klocalgrid }{Estimate of local \eqn{K[i](r)} at the grid points.}
  \item{R }{Distance \eqn{r} at which the estimation is made.}
  \item{nx }{Density of the estimating grid  in the x-side. } 
  \item{ny }{Density of the estimating grid  in the x-side. } 
  \item{dataname }{Name of the ppp object analysed. } 
  \item{ppp }{Original point pattern.}

  \code{plot.ecespa.getis} plots an interpolated map of the selected local statistics
}
\note{
As \code{plot.ecespa.getis} interpolates over rectangular grid of points, it is not apropriate to map irregular windows. In those cases, \code{\link[spatstat.core]{Smooth.ppp}} of \code{spatstat}
can be used to interpolate the local statistics (see examples).
}
\references{ 
Getis, A. and Franklin, J. 1987. Second-order neighbourhood analysis of mapped point patterns. \emph{Ecology} 68: 473-477. \url{https://doi.org/10.2307/1938452}.
 }
\author{ Marcelino de la Cruz Rot }
\seealso{ \code{\link[spatstat.core]{localK}}, a different approach in \pkg{spatstat}. }
\examples{

  ## Compare with fig. 5b of Getis & Franklin (1987: 476):
  
  data(ponderosa)
  
  #ponderosa12 <- getis(ponderosa, nx = 30, ny = 30, R = 12)
  ponderosa12 <- getis(ponderosa, nx = 20, ny = 20, R = 12)
  
  plot(ponderosa12, type = "l", dimyx=256)
  
\dontrun{
  ## Plot the same, using Smooth.ppp in spatstat
  
  ponderosa.12 <- setmarks(ponderosa, ponderosa12$klocal)
  
  Z <- Smooth(ponderosa.12, sigma=5, dimyx=256)
  
  plot(Z, col=topo.colors(128), main="smoothed neighbourhood density")
  
  contour(Z, add=TRUE)
  
  points(ponderosa, pch=16, cex=0.5) 
  

  ## Example with irregular window:
  
  data(letterR)
  
  X <- rpoispp(50, win=letterR)
  
  X.g <- getis(X, R=0.2)
  
  plot(X.g,dimyx=c(200,100))
  
   ## Plot the same, using Smooth.ppp in spatstat
    X2 <- setmarks(X, X.g$klocal)
  
    Z <- Smooth(X2, sigma=0.05, dimxy=256)
  
    plot(Z, col=topo.colors(128), main="smoothed neighbourhood density")
  
    contour(Z, add=TRUE)
  
    points(X, pch=16, cex=0.5)
  
    
    }
}
\keyword{ spatial }
