% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{id_mat}
\alias{id_mat}
\title{Extract chain and iteration IDs for each sample}
\usage{
id_mat(post)
}
\arguments{
\item{post}{A \code{\link[coda:mcmc.list]{mcmc.list}} object.}
}
\value{
A matrix with columns \code{"CHAIN"} and \code{"ITER"}.
}
\description{
Extract chain and iteration IDs for each sample
}
\note{
This is \strong{not} a function users will generally use directly.
}
