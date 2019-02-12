#' mmReportList
#' Getin last 100 reports
#'
#' @param acc_id
#' @param ProjectId
#' @param mm_token
#'
#' @return
#' @export
#'
#' @examples
mmReportList <- function(acc_id = NULL,
                         ProjectId = NULL,
                         mm_token = new_token) {
  answer <- httr::GET(paste0("https://app.mymarilyn.ru/api/projects/",ProjectId,"/reports?page=1&per_page=100"),
                      httr::add_headers("X-API-Account" = acc_id,
                                        "X-API-Token" = mm_token))
  message(httr::content(answer, "parsed", "application/json")$status)

    return(httr::content(answer, "parsed", "application/json"))
}

