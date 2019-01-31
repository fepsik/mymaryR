#' mmGetReportFields
#'
#' @param acc_id
#' @param mm_token
#' @param ProjectId
#'
#' @return
#' @export
#'
#' @examples
mmGetReportFields <- function(acc_id = NULL, mm_token = new_token, ProjectId = NULL) {
  answer <- httr::GET(paste0("https://app.mymarilyn.ru/api/projects/",ProjectId,"/reports/fields"),
                      httr::add_headers("X-API-Account" = acc_id,
                                        "X-API-Token" = mm_token))
  message(answer$status_code)


  content <- httr::content(answer, "parsed", "application/json")



  data <- list()

  dataRaw <- httr::content(answer, "parsed", "application/json")
  for (n in 1:length(dataRaw[["metrics"]])){

    for (i in 1:length(dataRaw[["metrics"]][[n]][["metrics"]])) {
      dataTemp <- data.frame(
        dataRaw[["metrics"]][[n]][["metrics"]][[i]][c('id','name')],category = dataRaw[["metrics"]][[n]][["group"]])
    data <- rbind(data, dataTemp)
  }
}








  return(data)


}
