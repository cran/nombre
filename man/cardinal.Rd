% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cardinal.R
\name{cardinal}
\alias{cardinal}
\alias{nom_card}
\title{Convert numbers to cardinal character vectors (one, two, three)}
\usage{
cardinal(x, max_n = Inf, negative = "negative", ...)

nom_card(x, max_n = Inf, negative = "negative", ...)
}
\arguments{
\item{x}{A numeric vector}

\item{max_n}{A numeric vector.
When the absolute value of \code{x} is greater than \code{max_n}, \code{x} remains
numeric instead of being converted to words.
If \code{max_n} is negative, no \code{x}s will be converted to words.
(This can be useful when \code{max_n} is passed by another function.)
Defaults to \code{Inf}, which converts all \code{x}s to words.}

\item{negative}{A character vector to append to negative numbers.
Defaults to \code{"negative"}.}

\item{...}{
  Arguments passed on to \code{\link[fracture:frac_mat]{fracture::frac_mat}}
  \describe{
    \item{\code{denom}}{If \code{denom} is not \code{\link{NULL}}, all fractions will have a
denominator of \code{denom}. This will ignore all other arguments that affect
the denominator.}
    \item{\code{base_10}}{If \code{TRUE}, all denominators will be a power of 10.}
    \item{\code{common_denom}}{If \code{TRUE}, all fractions will have the same denominator.

If the least common denominator is greater than \code{max_denom},
\code{max_denom} is used.}
    \item{\code{max_denom}}{All denominators will be less than or equal to
\code{max_denom}.

If \code{base_10} is \code{TRUE}, the maximum denominator will be the largest power
of 10 less than \code{max_denom}.

A \code{max_denom} greater than the inverse square root of
\link[=.Machine]{machine double epsilon} will produce a warning because floating
point rounding errors can occur when denominators grow too large.}
  }}
}
\value{
A character vector of the same length as \code{x}
}
\description{
Convert numbers to cardinal character vectors (one, two, three)
}
\section{Fractions}{
Decimal components of \code{x} are automatically converted to fractions by
\code{\link[fracture:frac_mat]{fracture::frac_mat()}}.
}

\examples{
nom_card(2)
nom_card(1:10)
nom_card(2 + 4/9)
nom_card(-2)
nom_card(-2, negative = "minus")

nom_card(5:15, max_n = 10)

paste("There are", nom_card(525600), "minutes in a year.")
paste("There are", nom_card(3.72e13), "cells in the human body.")

nom_card(1 / 2^(1:4))
nom_card(1 / 2^(1:4), common_denom = TRUE)
nom_card(1 / 2^(1:4), base_10 = TRUE)
nom_card(1 / 2^(1:4), base_10 = TRUE, common_denom = TRUE)

nom_card(1 / 2:5)
nom_card(1 / 2:5, base_10 = TRUE)
nom_card(1 / 2:5, base_10 = TRUE, max_denom = 100)
}
\seealso{
\code{\link[=uncardinal]{uncardinal()}} to convert character vectors to numbers

Other number names: 
\code{\link{adverbial}()},
\code{\link{collective}()},
\code{\link{denominator}()},
\code{\link{numerator}()},
\code{\link{ordinal}()},
\code{\link{ratio}()}
}
\concept{number names}
