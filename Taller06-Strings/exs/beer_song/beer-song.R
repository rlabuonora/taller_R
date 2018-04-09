library(Hmisc)

lyrics <- function(first, last) {
  paste(sapply(first:last, verse), collapse = "\n")
}

first_line <- function(n) {
  if (n == 0) {
    a <- "no more bottles"
  }
  else if (n == 1) {
    a <- sprintf("%d bottle", n)
  }
  else {
    a <- sprintf("%d bottles", n)
  }
  lyrics <- "%s of beer on the wall, %s of beer."
  sprintf(lyrics, capitalize(a), a)
}

second_line <- function(n) {
  if (n == 0) {
    return("Go to the store and buy some more, 99 bottles of beer on the wall.\n")
  }
  else if (n == 1) {
    a <- "it"
    b <- "no more bottles"
  }
  else if (n == 2) {
    a <- "one"
    b <- "1 bottle"
  }
  else {
    a <- "one"
    b <- sprintf("%d bottles", n-1)
  }
  lyrics <- "Take %s down and pass it around, %s of beer on the wall.\n"
  sprintf(lyrics, a, b)
}

verse <- function(number) {
    paste(sep = "\n",
      first_line(number),
      second_line(number)
    )
}

