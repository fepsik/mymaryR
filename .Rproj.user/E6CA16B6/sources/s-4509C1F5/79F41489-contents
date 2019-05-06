#'Getting Orders and
#'ProjectId can be Vector!
#'
#' @param acc_id
#' @param ProjectId
#' @param mm_token
#'
#'@export

mmGetOrders <- function(acc_id = NULL, ProjectId = NULL, mm_token = new_token) {

  data <- data.frame()
  for (n in 1:length(ProjectId)){
    answer <- httr::GET(paste0("https://app.mymarilyn.ru/api/projects/",as.character(ProjectId[n]),"/orders"),add_headers("X-API-Account" = acc_id, "X-API-Token" = mm_token))
    httr::stop_for_status(answer)

    if (answer$status_code == 200) message("Lucky You!") else message("Bad Day")

    dataRaw <- httr::content(answer, "parsed", "application/json")
  for (i in 1:length(dataRaw$items)){
    dataTemp <- data.frame(t(as.data.frame(unlist(dataRaw$items[[i]][c('id','name','channel_id','start_date','end_date','cost','cost_fact','budget','clicks_planned','clicks','impressions_planned','impressions','cost_fact_yesterday')],recursive = T))),project_id = ProjectId[n],row.names = NULL)
    data <- rbind(data, dataTemp)
  }
  }
  return(data)
}
