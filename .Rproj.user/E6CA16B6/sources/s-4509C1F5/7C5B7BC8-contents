#'@param mm_token
#'
#'@export
mmGetChannels <- function(mm_token = new_token) {

  answer <- httr::GET("https://app.mymarilyn.ru/api/channels",add_headers("X-API-Token" = mm_token))
  httr::stop_for_status(answer)

  if (answer$status_code == 200) message("Complete") else message("Wrong")

  dataRaw <- httr::content(answer, "parsed", "application/json")

  data <- data.frame()
  for (i in 1:length(dataRaw$items)){
    #Replace NULL to NA
    dataRaw$items[[i]][sapply(dataRaw$items[[i]], is.null)] <- NA
    dataTemp <- data.frame(t(as.data.frame(unlist(dataRaw$items[[i]],recursive = T))),row.names = NULL)
    data <- rbind(data, dataTemp)
  }
  dataFin <- data.frame(channel_name = as.character(data$name),
                       channel_id = as.character(data$id))
  return(dataFin)
}

