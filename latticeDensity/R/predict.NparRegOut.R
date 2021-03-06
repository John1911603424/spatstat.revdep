#' Predictions at data locations from 
#' lattice-based non-parametric regression.
#' 
#' Takes as input a NparRegOut object from 
#' the function createNparReg. A vector of 
#' predicted values is produced corresponding 
#' to each location in the data.
#' 
#' @details 
#' If new_pred is not used as an arguments, this 
#' function returns a vector of predictions at 
#' each node closest to an observations of the 
#' original point process. If you wish to make 
#' predictions at arbitrary locations, let 
#' new_pred be a 2-column matrix of those 
#' locations. Note that all predictions are 
#' actually at the nearest node to the desired 
#' locations. NOTE: Like all functions in this 
#' package, new locations are relocated to the 
#' nearest node in the region, even if they are 
#' outside the boundary. Thus you should ensure 
#' that your locations of interest are inside 
#' the boundary and that the density of nodes 
#' is high enough that the nearest node is close 
#' enough to the location you queried.
#' 
#' @references Julie McIntyre, Ronald P. Barry (2018)  A Lattice-Based 
#' Smoother for Regions with Irregular Boundaries and Holes.  
#' Journal of Computational and Graphical Statistics.  In Press.
#' @param object An object of type NparRegOut returned by createNparReg.
#' @param new_pred if new_pred is left out, predictions are made at the 
#' locations of the point pattern. Otherwise, new_pred is a 2-column matrix 
#' of locations where you wish to obtain predictions.
#' @param \dots Aditionally arguments affecting the predictions, of which 
#' there are none at this time.
#' @author Ronald P. Barry
#' @examples 
#' data(nparExample)
#' attach(nparExample)
#' plot.new()
#' #  Simulate a response variable
#' index1 <- (grid2[,2]<0.8)|(grid2[,1]>0.6)
#' Z <- rep(NA,length(grid2[,1]))
#' n1 <- sum(index1)
#' n2 <- sum(!index1)
#' Z[index1] <- 3*grid2[index1,1] + 4 + rnorm(n1,0,sd=0.4)
#' Z[!index1] <- -2*grid2[!index1,1] + 4 + rnorm(n2,0,sd=0.4)
#' #
#' plot(polygon2,type="n")
#' polygon(polygon2)
#' points(grid2,pch=19,cex=0.5,xlim=c(-0.1,1))
#' text(grid2,labels=round(Z,1),pos=4,cex=0.5)
#' #  Following is the generation of the nonparametric
#' #  regression prediction surface.
#' nodeFillingOutput <- nodeFilling(poly=polygon2, node_spacing=0.025)
#' plot(nodeFillingOutput)
#' formLatticeOutput <- formLattice(nodeFillingOutput)
#' plot(formLatticeOutput)
#' NparRegOut <- createNparReg(formLatticeOutput,Z,PointPattern=grid2,k=2)
#' plot(NparRegOut)
#' predict(NparRegOut)
#' 
#' @import utils
#' @import graphics
#' @import stats
#' @import spatstat
#' @import sp
#' @export
#' @method predict NparRegOut
predict.NparRegOut <-
function(object,new_pred = NULL,...){
#
Zk <- as.vector(object$NparRegNum)
Pk <- as.vector(object$NparRegDenom)
if(is.null(new_pred)){
  which_nodes <- as.vector(object$which_nodes)
  predictions <- (Zk/Pk)[which_nodes]
  return(predictions)
  }else{
    temp <- sp::bbox(rbind(new_pred,object$nodes))
    bound_vect <- c(temp[1,1],temp[1,2],temp[2,1],temp[2,2])
    X <- spatstat.geom::as.ppp(new_pred,W = bound_vect)
    Y <- spatstat.geom::as.ppp(object$nodes,W=bound_vect)
    closest <- spatstat.geom::nncross(X,Y)$which
    Pk[Pk==0] <- 1
    Zk[Pk==0] <- mean(Zk)*length(Zk)
    out <- (Zk/Pk)[closest]
    return(out)
  }
  }
