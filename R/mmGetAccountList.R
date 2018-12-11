#'Get Accounts
#'
#' @param acc_id
#' @param mm_token
#'
#'@export
mmGetAccountList <- function(acc_id = NULL, mm_token = new_token) {
acc_id <- as.character(acc_id)

answer <- httr::GET("https://app.mymarilyn.ru/api/accounts",
                    httr::add_headers("X-API-Account" = acc_id, "X-API-Token" = mm_token))

httr::stop_for_status(answer)
if (answer$status_code == 200) message("Alright!") else message("Not Today!")

dataRaw <- httr::content(answer, "parsed", "application/json")

data <- data.frame()
for (i in 1:length(dataRaw$items)){
  dataTemp <- data.frame(t(as.data.frame(unlist(dataRaw$items[[i]][c('id','name','type','status')],recursive = T))),row.names = NULL)
  data <- rbind(data, dataTemp)
}

dataTotal <- data.frame(
  Id = as.character(data$id),
  Name = as.character(data$name),
  Type = as.character(data$type),
  Status = as.character(data$status)
)

return(dataTotal)

}
