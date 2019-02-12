#' Creates report.
#'
#' @param acc_id
#' @param ProjectId
#' @param mm_token
#' @param start_date
#' @param end_date
#' @param dimensions
#' @param metrics
#' @param locale
#' @param format
#' @param entity_type
#' Type of entities to get report for: “ORDER” or “PLACEMENT”.
#' @param entities
#' @param operating_networks
#'
#' @return
#' @export
#'
#' @examples
mmCreateReport <- function(acc_id = NULL,
                           ProjectId = NULL,
                           mm_token = new_token,
                           start_date = Sys.Date(),
                           end_date = Sys.Date(),
                           entity_type = "ORDER",
                           entities = NULL,
                           dimensions = c("date"),
                           operating_networks = c("NETWORK","SEARCH","MIXED","VIDEO"),
                           metrics = c("impressions", "clicks"),
                           locale = "ru",
                           format = "XLSX") {


  statement <- list(as.integer(ProjectId),start_date, end_date, entity_type, as.integer(entities),
       dimensions,
       operating_networks,
       metrics,
       FALSE,
       FALSE,
       locale,
       format
  )


  names(statement) <- c("project_id",
                   "start_date",
                     "end_date",
                     "entity_type",
                     "entities",
                     "dimensions",
                     "operating_networks",
                     "metrics",
                     "exclude_discount",
                     "with_vat",
                     "locale",
                     "report_format")

  answer <- httr::POST("https://app.mymarilyn.ru/api/reports",
                      httr::add_headers("X-API-Account" = acc_id,
                                  "X-API-Token" = mm_token),
                      body = statement, encode = "json")
  httr::stop_for_status(answer)
  message(answer$status_code)
  return(httr::content(answer, "parsed", "application/json"))


}

