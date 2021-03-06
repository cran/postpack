% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{rm_regex_lock}
\alias{rm_regex_lock}
\title{Remove the symbols that lock in a string for matching}
\usage{
rm_regex_lock(params)
}
\arguments{
\item{params}{Node names to remove a \code{^} and \code{$} from (if present).}
}
\value{
A character vector with locking anchors inserted to force an exact match. For example,
\verb{"^a\\\[1\\\]$"} becomes \verb{"a\\\[1\\\]"}.
}
\description{
Undoes the work of \code{\link[=ins_regex_lock]{ins_regex_lock()}}.
}
\note{
This is \strong{not} a function users will generally use directly.
}
