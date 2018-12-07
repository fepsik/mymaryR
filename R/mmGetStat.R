#'Function that get stats
#'@export
#'
mmGetStat <- function(acc_id = NULL, ProjectId = NULL, mm_token = new_token, start_date = NULL, end_date = NULL, date_group = "month", group = "no") {
  
  data <- data.frame()
  for (n in 1:length(ProjectId)){
    answer <- httr::GET(paste0("https://app.mymarilyn.ru/api/projects/",as.character(ProjectId[n]),"/statistics?start_date=",start_date,"&end_date=",end_date,"&date_grouping=",date_group,"&grouping=",group),
                  add_headers("X-API-Account" = acc_id,
                              "X-API-Token" = mm_token))
    stop_for_status(answer)
    
    if (answer$status_code == 200) message("Nice to meet u") else message("Unlucky u")
    
    dataRaw <- httr::content(answer, "parsed", "application/json")
    for (i in 1:length(dataRaw$items)){
      dataTemp <- data.frame(t(as.data.frame(unlist(dataRaw$items[[i]][c('id','order_id','project_id','date','order_name','channel_id','cost','cost_fact','impressions','clicks','video_views','reach')],
                                                    recursive = T))),project_id = ProjectId[n],row.names = NULL)
      data <- rbind(data, dataTemp)
    }
  }

  return(data)

}



