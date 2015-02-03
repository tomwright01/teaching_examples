resampleMatrix<-function(M,new_pixel_size)
{
  #Resample a binary matrix M such that each value in M (pixel) is represented by size * size pixels in the output
  #INPUTS
  # M - an NxM binary matrix
  # size - size of the output pixels
  #OUTPUT
  # matrix - an (N*size)x(M*size) binary matrix
  #USAGE
  # newImg<-resampleMatrix(M,2)
  #Example:
  #   [1,0,0    [1,1,0,0,0,0
  #    0,0,0     1,1,0,0,0,0
  #    0,0,0]    0,0,0,0,0,0
  #              0,0,0,0,0,0
  #              0,0,0,0,0,0
  #              0,0,0,0,0,0]
  
  # Define a helper function, this function is only available inside the resampleMatrix function
  getNeighbours<-function(index,size)
  {
    #helper function to find neighbouring pixels
    size<-size-1
    rows<-vector(length=size) #preallocate the output vectors, probs not needed
    cols<-vector(length=size)
    
    rows<-index[1]:(index[1] + size)
    cols<-index[2]:(index[2] + size)
    return(expand.grid(rows,cols))
  }
  
  #Find the row,col coordinates for values where M==1
  coords<-which(M==1,arr.ind=TRUE)  
  
  #calculate the top left pixel index for each pixel in the new image
  coords<-((coords-1)*new_pixel_size)+1
  
  #Coords is a N*2 matrix where N is the number of 1's in M
  #use apply function to call getNeighbours on each row of coordinates
  targets <- apply(coords,1,getNeighbours,size=new_pixel_size)
  
  #pre-allocate the output matrix with 0's
  y<-matrix(0,ncol=ncol(M)*new_pixel_size,nrow=nrow(M)*new_pixel_size)
  
  #targets is a list of coordinates from getNeighbours(),
  #loop through each element in targets setting pixels in the output image to 1
  for(listItem in targets){
    y[listItem[,1],listItem[,2]]<-1
  }
  
  return(y)
}
