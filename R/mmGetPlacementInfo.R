#' Return placement info
#'
#' @param acc_id
#'
#' @param ProjectId
#' @param mm_token
#'
#'@export
mmGetPlacementInfo <- function(acc_id = NULL, ProjectId = NULL, mm_token = new_token) {

  data <- data.frame()
  for (n in 1:length(ProjectId)){
    answer <- httr::GET(paste0("https://app.mymarilyn.ru/api/projects/",as.character(ProjectId[n]),"/placements"),httr::add_headers("X-API-Account" = acc_id, "X-API-Token" = mm_token))
    httr::stop_for_status(answer)

    if (answer$status_code == 200) message("Ok") else message("Not Ok!")

    dataRaw <- httr::content(answer, "parsed", "application/json")
    for (i in 1:length(dataRaw$items)){
      dataTemp <- data.frame(t(as.data.frame(unlist(dataRaw$items[[i]][c('id','project_id','order_ids','name','campaign_xid','utm_source','utm_campaign','fact_status')],recursive = T))),row.names = NULL)
      data <- rbind(data, dataTemp)
    }
  }
  names(data)[1] <- "placement_id"
  return(data)

}
