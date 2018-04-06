raindrops <- function(number) {
  
  ifelse(number%%3==0,"Pling",ifelse(number%%5==0, "Plang", ifelse(number%%7==0,"Plong",ifelse(number%%3==0 & number%%5==0,"PlingPlang",ifelse(number%%3==0 & number%%7==0,"PlingPlong",as.character(number))))))
  
}

