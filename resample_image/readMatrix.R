readMatrix <- function(fname){
  #read a matrix from a text file
  #INPUTS
  # fname - full path to file
  #OUTPUTS
  # matrix
  #USAGE
  # dat<-readMatrix(filename)
  # based on code by luca.cerone@gmail.com
  
  #Check if the file exists
  if(!file.exists(fname))
  {
    stop(sprintf('File: %s not found',fname))
  }
  
  con = file(fname,"r") #open a connection to the file
  contents<-readLines(con) #read the contents of the file into memory
  values<-strsplit(contents,"") #split each line into individual pixel values
  
  #output of strsplit is a list, lapply 'applies' a function to all elements of the list
  values<-lapply(values, as.numeric) #convert elements of the list from strings to integers
  M = do.call(rbind, values) #use rbind function to join all the list elements into a matrix
  close(con) #close the file connection
  return(M)
}