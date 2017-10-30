# This is a stub function to take two strings
# and calculate the hamming distance
hamming <- function(strand1, strand2) {

  a <- vector(mode="integer", length=nchar(strand1))

  for (i in 1:nchar(strand1)) {  
  
    if (nchar(strand1)!=nchar(strand2)) 
      stop() 
    else  
        a[i] <- if  (substr(strand1, start = i, stop = i)!=substr(strand2, start = i, stop = i)) 
          1 
        else 
          0
    }
  sum(a)
  
}


 
# This is called the 'Hamming distance'.
# 
# It is found by comparing two DNA strands and counting how many of the
# nucleotides are different from their equivalent in the other string.
# 
# GAGCCTACTAACGGGAT
# CATCGTAATGACGGCCT
# ^ ^ ^  ^ ^    ^^
#   
#   The Hamming distance between these two DNA strands is 7.