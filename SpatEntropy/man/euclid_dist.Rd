% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/adj_matrix.R
\name{euclid_dist}
\alias{euclid_dist}
\title{Euclidean distance.}
\usage{
euclid_dist(coords1, coords2 = coords1)
}
\arguments{
\item{coords1}{A two column matrix containing starting coordinates.
Provided by user or as output of \code{\link[=coords_pix]{coords_pix()}}.}

\item{coords2}{A two column matrix with containing coordinates, same as \code{coords1} by default.}
}
\value{
An upper-triangular distance matrix: a \code{nrow(coords1)} x \code{nrow(coords2)} matrix with Euclidean distances between points.
}
\description{
\code{euclid_dist} computes the Euclidean distance between all point couples/pairs
identified by two coordinate matrices.
Useful alone, or together with \code{\link[=adj_mat]{adj_mat()}}.
}
\details{
\code{euclid_dist} needs two matrices listing the coordinates of two sets of points.
It computes the Euclidean distance between each point of the first matrix and
all points of the second matrix. The default option provides the Euclidean distance
between all points in a single set.
}
\examples{
euclid_dist(cbind(runif(10), runif(10)))

}
