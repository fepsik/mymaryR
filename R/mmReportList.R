#' mmReportList
#' Getin last 10 reports
#'
#' @param acc_id
#' @param ProjectId
#' @param mm_token
#'
#' @return
#' @export
#' @name mmReportList
#' @description Getin last 10 reports
#' @examples mmReportList(acc_id = 12345, ProjectId = 12345, mm_token = new_token)
mmReportList <- function(acc_id = NULL,
                         ProjectId = NULL,
                         mm_token = new_token) {
  data <- data.frame()

  answer <- httr::GET(paste0("https://app.mymarilyn.ru/api/projects/",ProjectId,"/reports?page=1&per_page=10"),
                      httr::add_headers("X-API-Account" = acc_id,
                                        "X-API-Token" = mm_token))
  httr::stop_for_status(answer)

  if (answer$status_code == 200) message("Alright!") else message("Not Today!")

  dataRaw <- httr::content(answer, "parsed", "application/json","text/javascript")

  for (i in 1:length(dataRaw$items)){
    dataTemp <- data.frame(t(as.data.frame(unlist(dataRaw$items[[i]][c('id','file_name','status','created_at','start_date','end_date')],
                                                  recursive = T))),project_id = ProjectId,row.names = NULL)
    if (is.null(dataTemp$file_name) == F){
    data <- rbind(data, dataTemp)
    }
  }

  return(data)

}


