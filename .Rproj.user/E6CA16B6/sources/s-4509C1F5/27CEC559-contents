#' mmReportInfo
#'
#' @param acc_id
#' @param mm_token
#' @param report_id
#'
#' @return
#' @export
#'
#' @examples
mmReportInfo <- function(acc_id = NULL,
                         mm_token = new_token,
                         report_id =  NULL) {
  answer <- httr::GET(paste0("https://app.mymarilyn.ru/api/reports/",report_id),
                       httr::add_headers("X-API-Account" = acc_id,
                                         "X-API-Token" = mm_token))
  message(httr::content(answer, "parsed", "application/json")$status)
  if (httr::content(answer, "parsed", "application/json")$status == "DONE") {
    return(paste0("https://app.mymarilyn.ru",httr::content(answer, "parsed", "application/json")$file_name))
  }
  else message(httr::content(answer, "parsed", "application/json")$status)
}

