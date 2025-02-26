% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pad_fn.R
\name{pad_fn}
\alias{pad_fn}
\title{Pad a vector of numbers to align on the decimal point.}
\usage{
pad_fn(x, nsmall = 2)
}
\arguments{
\item{x}{a vector of numbers to pad/align at the decimal point}

\item{nsmall}{max number of decimal places to round at/display}
}
\value{
Returns a gt table
}
\description{
This helper function adds whitespace to numeric values so that they can
be aligned on the decimal without requiring additional trailing zeroes.
}
\section{Figures}{

\if{html}{\figure{gt_pad_fn.png}{options: width=20\%}}
}

\section{Function ID}{

3-2
}

\examples{

library(gt)
padded_tab <- data.frame(x = c(1.2345, 12.345, 123.45, 1234.5, 12345)) \%>\%
  gt() \%>\%
  fmt(fns = function(x){pad_fn(x, nsmall = 4)}) \%>\%
  tab_style(
    # MUST USE A MONO-SPACED FONT
    style = cell_text(font = google_font("Fira Mono")),
    locations = cells_body(columns = x)
    )

}
\seealso{
Other Utilities: 
\code{\link{fmt_symbol_first}()}
}
\concept{Utilities}
