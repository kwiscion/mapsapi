% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mp_get_points.R
\name{mp_get_points}
\alias{mp_get_points}
\title{Extract geocoded points from Google Maps Geocode API response}
\usage{
mp_get_points(doc, all_results = FALSE)
}
\arguments{
\item{doc}{XML document with Google Maps Geocode API response}

\item{all_results}{The geocoder may return several results when address queries are ambiguous. Should all results be returned (\code{TRUE}), or just the first one (\code{FALSE}, default)?}
}
\value{
\code{sf} Point layer representing geocoded locations
}
\description{
Extract geocoded points from Google Maps Geocode API response
}
\examples{
library(xml2)
doc = list("Tel-Aviv" = as_xml_document(response_geocode))
pnt = mp_get_points(doc)
\dontrun{
doc = mp_geocode(addresses = c("Rehovot", "Beer-Sheva", "New-York"))
pnt = mp_get_points(doc)
}
}
