% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mp_get_routes.R
\name{mp_get_routes}
\alias{mp_get_routes}
\title{Extract *routes* from Google Maps Directions API response}
\usage{
mp_get_routes(doc)
}
\arguments{
\item{doc}{XML document with Google Maps Directions API response}
}
\value{
Line layer (class \code{sf}) representing routes.

When document contains no routes ("ZERO_RESULTS" status), the funtion returns an empty line layer with \code{NA} in all fields.
}
\description{
Extract *routes* from Google Maps Directions API response
}
\examples{
library(xml2)

doc = as_xml_document(response_directions_driving)
r = mp_get_routes(doc)
plot(r)

doc = as_xml_document(response_directions_transit)
r = mp_get_routes(doc)
plot(r)

\dontrun{

# Text file with API key
key = readLines("~/key")

# Transit example
doc = mp_directions(
  origin = c(34.81127, 31.89277),
  destination = c(34.781107, 32.085003),
  mode = "transit",
  alternatives = TRUE,
  key = key
)
r = mp_get_routes(doc)
plot(r)

# Duration in traffic
doc = mp_directions(
  origin = c(34.81127, 31.89277),
  destination = c(34.781107, 32.085003),
  departure_time = Sys.time(),
  alternatives = TRUE,
  key = key
)
r = mp_get_routes(doc)
plot(r)

# Using waypoints
doc = mp_directions(
  origin = c(34.81127, 31.89277),
  waypoints = rbind(c(35.01582, 31.90020), c(34.84246, 31.85356)),
  destination = c(34.781107, 32.085003),
  key = key
)
r = mp_get_routes(doc)
plot(r)

}
}
