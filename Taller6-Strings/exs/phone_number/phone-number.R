parse_phone_number <- function(number_string) {
  digits <- as.vector(str_match_all(number_string, "\\d")[[1]])
  n <- length(digits)
  if (n < 10 | n > 11) { # incorrect length
    NULL
  }
  else if (n == 11 && digits[[1]] != 1) { # area code != 1
    NULL
  }
  else {
    area_code <- digits[[n-9]] # extract ac
    exchange_code <- digits[[n-6]] # extract ec
    if (area_code < 2 | exchange_code < 2) { # invalid ac or ec
      NULL
    }
    else {
      paste(digits[(n-10+1):n], sep="", collapse="")
    }
  }
}
