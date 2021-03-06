% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/grid_area.R
\name{grid_area}
\alias{grid_area}
\title{Make a grid from a Polygon}
\usage{
grid_area(shape, resol = 500, prop = 1, plotGrid = FALSE)
}
\arguments{
\item{shape}{Shape file of the considered area}

\item{resol}{The resolution of the grid in meters. Default is 500}

\item{prop}{A factor used for grid calculation. Determines the percentage a
grid has to overlay the considered area to be represented as grid cell.
Default is 1.}

\item{plotGrid}{Logical value indicating whether resulting grid should be
plotted or not. Default is FALSE.}
}
\value{
Returns a list with 2 elements. List element 1 will have the grid
  cell IDS, and the X and Y coordinates of the centers of each grid cell.
  List element 2 is the grid as SpatialPolygons, which is used for plotting
  purposes.
}
\description{
Create a grid from a given polygon and with a certain resolution
  and proportionality. The center points of each grid cell represent possible
  locations for wind turbines.
}
\note{
The grid of the genetic algorithm will have a resolution of \code{Rotor
  * fcrR}. See the arguments of \code{\link{windfarmGA}}
}
\examples{
library(sp)
library(raster)
library(rgeos)

## Exemplary input Polygon with 2km x 2km:
Polygon1 <- Polygon(rbind(c(0, 0), c(0, 2000),
c(2000, 2000), c(2000, 0)))
Polygon1 <- Polygons(list(Polygon1),1);
Polygon1 <- SpatialPolygons(list(Polygon1))
Projection <- "+init=epsg:3035"
proj4string(Polygon1) <- Projection

## Create a Grid
grid_area(Polygon1,200,1,TRUE)
grid_area(Polygon1,400,1,TRUE)


## Examplary irregular input Polygon
Polygon1 <- Polygon(rbind(c(0, 20), c(0, 200),
                          c(2000, 2000), c(3000, 0)))
Polygon1 <- Polygons(list(Polygon1),1);
Polygon1 <- SpatialPolygons(list(Polygon1))
Projection <- "+init=epsg:3035"
proj4string(Polygon1) <- Projection

## Create a Grid
grid_area(Polygon1,200,1,TRUE)
grid_area(Polygon1,200,0.5,TRUE)
grid_area(Polygon1,200,0.1,TRUE)
grid_area(Polygon1,400,1,TRUE)
grid_area(Polygon1,400,0.5,TRUE)
grid_area(Polygon1,400,0.1,TRUE)

}
\references{
\url{http://rfunctions.blogspot.co.at/2014/12/gridfilter-intersect-grid-with-shape.html}
}
\seealso{
Other Helper Functions: 
\code{\link{dup_coords}()},
\code{\link{getDEM}()},
\code{\link{getISO3}()},
\code{\link{get_grids}()},
\code{\link{hexa_area}()},
\code{\link{isSpatial}()},
\code{\link{permutations}()},
\code{\link{readintegerSel}()},
\code{\link{readinteger}()},
\code{\link{splitAt}()},
\code{\link{tess2SPdf}()},
\code{\link{windata_format}()}
}
\author{
Jose Hidasi (original) / Sebastian Gatscha (adapted)
}
\concept{Helper Functions}
