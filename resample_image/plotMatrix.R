plotMatrix<-function(M)
{
  #Plots an NxM binary matrix
  
  #INPUTS
  # M - an NxM binary matrix
  #OUTPUTS
  # None
  
  #Based on code by jenny@stat.ubc.ca
  
  require(ggplot2)
  require(reshape2) # for melt
  
  #Convert from matrix format to 'long format', output from melt is a data.frame
  #each row is a single pixel c(y-coord,x-coord,value)
  coords<-melt(M)
  
  ggplot(coords, aes(x = Var1, y = Var2, fill = value)) +
    geom_tile() + coord_fixed() +
    scale_fill_gradient2(low = "grey100", high = "grey0", limits = c(0, 1)) +
    theme_bw() + guides(fill = FALSE) +
    theme(panel.grid.major = element_blank(),
          panel.border = element_blank(),
          axis.title = element_blank(),
          axis.text = element_blank(),
          axis.ticks = element_blank())
}