% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{rm_regex_bracket}
\alias{rm_regex_bracket}
\title{Remove escapes on regex brackets}
\usage{
rm_regex_bracket(params)
}
\arguments{
\item{params}{Node names.}
}
\value{
A character vector with all brackets escaped. For example,
\verb{"a\\\[1\\\]"} becomes \code{"a[1]"}.
}
\description{
Remove escapes on regex brackets
}
\details{
Searches the contents of a string for the occurrence of a
square bracket or two (that has been escaped), and removes the escaping
that was necessary for matching via regular expressions.
}
\note{
This is \strong{not} a function users will generally use directly.
}
