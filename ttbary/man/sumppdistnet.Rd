% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ppdist.R
\name{sumppdistnet}
\alias{sumppdistnet}
\title{Compute Sum of q-th Powers of Distances Between a Point Pattern and a Collection of Point Patterns on a Network}
\usage{
sumppdistnet(
  dmat,
  zeta,
  ppmatrix,
  penalty = 1,
  type = c("tt", "rtt", "TT", "RTT"),
  p = 1,
  q = 1
)
}
\arguments{
\item{dmat}{the distance matrix of a network containing all shortest-path distances between its vertices.}

\item{zeta}{a vector specifying the vertex-indices of zeta.}

\item{ppmatrix}{a matrix specifying in its columns the vertex-indices of the point patterns in the collection.
A virtual index that is one greater than the maximum vertex-index in the network
can be used to fill up columns so that they all have the same length.}

\item{penalty}{a positive number. The penalty for adding/deleting points.}

\item{type}{either \code{"tt"}/\code{"TT"} for the transport-transform metric
or \code{"rtt"}/\code{"RTT"} for the relative transport-transform metric.}

\item{p}{a number \eqn{>0}. Matchings between \code{zeta} and the patterns in
\code{ppmatrix} are chosen such that the \code{p}-th order sums (\eqn{\ell_p}{l_p}-norms)
of the shortest-path distances are minimized.}

\item{q}{a number \eqn{>0}.}
}
\value{
A nonnegative number, the \code{q}-th order sum of the TT-p- or RTT-p-distances 
        between the patterns represented by \code{zeta} and \code{ppmatrix}. This number has an attribute
        \code{distances} that contains the individual distances.
}
\description{
Based on the shortest-path metric in a network, determine the TT-p-distances (or RTT-p-distances) 
between a single point pattern \code{zeta} and a collection of point patterns. Then
compute the sum of \eqn{q}-th powers of these distances. The point patterns are
specified by vectors of indices referring to the vertices in the network.
}
\details{
The main purpose of this function is to evaluate the relative performance
         of approximate \eqn{q}-th order barycenters of point patterns. A true 
         \eqn{q}-th order barycenter of the point patterns \eqn{\xi_1,\ldots,\xi_k}{xi_1, ..., xi_k}
         with respect to the TT-p metric \eqn{\tau_p}{tau_p} minimizes 
         \deqn{\sum_{j=1}^k \tau_p(\xi_j, \zeta)^q}{sum_{j=1}^k tau_p(xi_j, zeta)^q}
         in \eqn{\zeta}{zeta}.      
        
        The most common choices are \code{p = q = 1} and \code{p = q = 2}. Other
        choices have not been tested.
}
\examples{
  # See examples for kmeansbarynet
  
}
\seealso{
\code{\link{kmeansbarynet}}, \code{\link{sumppdist}}
}
\author{
Raoul Müller  \email{raoul.mueller@uni-goettingen.de}\cr
        Dominic Schuhmacher \email{schuhmacher@math.uni-goettingen.de}
}
