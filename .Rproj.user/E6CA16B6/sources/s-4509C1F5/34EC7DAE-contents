#'GetProjects from acc
#'
#' @param acc_id
#' @param mm_token
#'
#'@export
mmGetProjects <- function(acc_id = NULL, mm_token = new_token) {

answer <- httr::GET("https://app.mymarilyn.ru/api/projects",
                    httr::add_headers("X-API-Account" = acc_id, "X-API-Token" = mm_token))

httr::stop_for_status(answer)

if (answer$status_code == 200) message("Alright!") else message("Not today, body")

dataRaw <- httr::content(answer, "parsed", "application/json")

data <- data.frame()
for (i in 1:length(dataRaw$items)){
  dataTemp <- data.frame(t(as.data.frame(unlist(dataRaw$items[[i]][c('id','status','name','cost','cost_fact','clicks_planned','clicks','impressions_planned','impressions','budget')],recursive = T))),row.names = NULL)
  data <- rbind(data, dataTemp)
}

return(data)
}
