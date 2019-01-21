#' mmReportCreator
#'
#' @param acc_id
#' @param ProjectId
#' @param mm_token
#' @param start_date
#' @param end_date
#' @param placements
#' @param dimensions
#' @param metrics
#' @param locale
#' @param format
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
                           placements = NULL,
                           dimensions = c("date", "ad_text", "keyword_text"),
                           metrics = c("impressions", "clicks", "ctr", "cpc_fact", "cost_fact"),
                           locale = "en",
                           format = "csv") {


  statement <- list(ProjectId,start_date, end_date,"PLACEMENT", placements,
       dimensions,
       "MIXED",
       metrics,
       FALSE,
       TRUE,
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
                      httr::add_headers("X-API-Account" = "7409",
                                  "X-API-Token" = mm_token),
                      body = statement, encode = "json")
  stop_for_status(answer)
  message(answer$status_code)
  message(httr::content(answer, "parsed", "application/json"))


}

