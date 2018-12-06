#'GetProjects from acc
#'@export
mmGetProjects <- function(acc_id = NULL, mm_token = new_token) {

answer <- GET("https://app.mymarilyn.ru/api/projects",
              add_headers("X-API-Account" = AccId, "X-API-Token" = new_token))

stop_for_status(answer)

if (answer$status_code == 200) message("Alright!") else message("Not today, body")

dataRaw <- content(answer, "parsed", "application/json")

data <- data.frame()
for (i in 1:length(dataRaw$items)){
  dataTemp <- data.frame(t(as.data.frame(unlist(dataRaw$items[[i]][c('id','status','name','cost','cost_fact','clicks_planned','clicks','impressions_planned','impressions','budget')],recursive = T))),row.names = NULL)
  data <- rbind(data, dataTemp)
}

return(data)
}