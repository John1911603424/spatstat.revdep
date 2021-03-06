% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/BAT.R
\name{kernel.beta}
\alias{kernel.beta}
\title{Beta diversity partitioning using kernel density hypervolumes.}
\usage{
kernel.beta(
  comm,
  trait,
  method = "gaussian",
  func = "jaccard",
  abund = TRUE,
  return.hv = FALSE,
  ...
)
}
\arguments{
\item{comm}{A 'HypervolumeList' object (one 'Hypervolume' object for each species or community) constructed with the hypervolume R package. Alternatively, a sites x species matrix, with incidence or abundance data about the species in the community.}

\item{trait}{A matrix of traits for each species in comm (a species for each row and traits as columns). Must be provided only if 'comm' is a sites x species matrix.}

\item{method}{Method for constructing the 'Hypervolume' objects. One of "box" (box kernel density estimation), "gaussian" (Gaussian kernel density estimation), or "svm" (one-class support vector machine). See respective functions of the hypervolume R package for details. Must be provided only if 'comm' is a sites x species matrix. Default is 'gaussian'.}

\item{func}{Partial match indicating whether the Jaccard or Soerensen family of beta diversity measures should be used.  If not specified, default is Jaccard.}

\item{abund}{A boolean (T/F) indicating whether abundance data should be used (TRUE) or converted to incidence (FALSE) before analysis. If not specified, default is TRUE. Ignored if a HypervolumeList is provided as input data.}

\item{return.hv}{Boolean indicating whether the hypervolume objects used to calculate beta diversity should be returned (default is FALSE).}

\item{...}{further arguments to be passed for other methods in hypervolume package.}
}
\value{
Three pairwise distance matrices, one per each of the three beta diversity components. If return.hv is set to TRUE, the function also returns the list of hypervolumes used to compute the distance matrices.
}
\description{
Pairwise beta diversity partitioning into replacement and net difference in amplitude components of n-dimensional hypervolumes.
}
\details{
Computes a pairwise decomposition of the overall differentiation among kernel hypervolumes into two components: the replacement (shifts) of space between hypervolumes and net differences between the amount of space enclosed by each hypervolume.
The beta diversity measures used here follow the FD partitioning framework developed by Carvalho & Cardoso (2018), where Btotal = Breplacement + Brichness. Beta diversity ranges from 0 (when hypervolumes are identical) to 1 (when hypervolumes are fully dissimilar).
See Carvalho & Cardoso (2018) and Mammola & Cardoso (2020) for the full formulas of beta diversity used here.
If abundance data of species in the community are provided as input data (abund = TRUE), each species trait is weighted by replicating it by the abundance in the estimation of the hypervolume.
}
\examples{
comm <- rbind(c(0,3,2,1), c(1,5,6,2), c(0,0,2,1))
rownames(comm) <- c("Community_1","Community_2","Community_3")
colnames(comm) <- c("Sp_1","Sp_2","Sp_3","Sp_4")

trait <- cbind(c(2.2,4.4,6.1,8.3),c(0.5,1,0.5,0.4),c(0.7,1.2,0.5,0.4))
rownames(trait) <- c("Sp_1","Sp_2","Sp_3","Sp_4")
colnames(trait) <- c("Trait_1","Trait_2","Trait_3")

#Example with community and trait matrices as input data:
#kernel.beta(comm = comm, trait = trait, return.hv = TRUE)

#Example with community and trait matrices as input data and abundance data
#kernel.beta(comm = comm, trait = trait, abund = TRUE, return.hv = FALSE)

#Example with hypervolumeList as input data:
#hv1 <- hypervolume_box(trait[comm[1,]==1,],name="Community_1")
#hv2 <- hypervolume_box(trait[comm[2,]==1,],name="Community_2")
#hv3 <- hypervolume_box(trait[comm[3,]==1,],name="Community_3")
#hvlist = hypervolume_join(hv1, hv2, hv3)
#kernel.beta(hvlist)

}
\references{
Carvalho, J.C. & Cardoso, P. (2018) Decomposing the causes for niche differentiation between species using hypervolumes. Frontiers in Ecology and Evolution, 8: 243.

Mammola, S. & Cardoso, P. (2020) Functional diversity metrics using kernel density n-dimensional hypervolumes. Methods in Ecology and Evolution, 11: 986-995.
}
