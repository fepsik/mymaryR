#' Get Token
#' 
#' Function for get token
#' @export
#' 
#' @examples
#' new_token <- mmGetToken(Login = "email-mail.ru", Password = "yourpassword123")
mmGetToken <- function(Login = NULL, Password = NULL) {
  message("Welcome!")
  token_raw  <- httr::PUT("https://app.mymarilyn.ru/api/auth",
                          body = list(email = Login,
                                      password = Password,
                                      ttl = 720),
                          encode = "json")
  if (token_raw$status_code == 200) message("Succes")
  else message("Fail")
  new_token <- as.character(content(token_raw)[3])
  return(new_token)
}