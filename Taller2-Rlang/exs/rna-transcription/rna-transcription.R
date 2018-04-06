# to_rna <- function(dna) {
#   
#  a<-strsplit(dna, "")[[1]]
#  
#   for (i in 1:nchar(dna)) { 
# 
#     a[[i]]<-if (a[[i]] =="G") "C" else (if (a[[i]] =="C") "G" else (if (a[[i]] =="T") "A" else (if (a[[i]] =="A") "U" else stop())))
#     
#   }
#  paste(a, collapse = '')
# }


to_rna <- function(dna) {
  
        a<-strsplit(dna, "")[[1]]
        
        case_when(dna=="G" ~"C",
                  dna=="C" ~"G",
                  dna=="T" ~"A",
                  dna=="A" ~"U",
                  TRUE  ~ stop())
                
        paste(a, collapse = '')
}
