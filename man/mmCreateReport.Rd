% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mmCrateReport.R
\name{mmCreateReport}
\alias{mmCreateReport}
\title{Creates report.}
\usage{
mmCreateReport(acc_id = NULL, ProjectId = NULL, mm_token = new_token,
  start_date = Sys.Date(), end_date = Sys.Date(),
  entity_type = "ORDER", entities = NULL, dimensions = c("date"),
  operating_networks = c("NETWORK", "SEARCH", "MIXED", "VIDEO"),
  metrics = c("impressions", "clicks"), locale = "ru",
  format = "XLSX", notification = FALSE)
}
\arguments{
\item{entity_type}{Type of entities to get report for: “ORDER” or “PLACEMENT”.}

\item{operating_networks}{}
}
\description{
Creates report.
}
