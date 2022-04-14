Circle_Plot <- function(x){

  library(ggplot2)

  Table <- table(x)


  Data_Frame <- as.data.frame(Table)

  Data_Frame$fraction <- Data_Frame$Freq / sum(Data_Frame$Freq)


  Data_Frame$ymax = cumsum(Data_Frame$fraction)

  Data_Frame$ymin = c(0, head(Data_Frame$ymax, n = -1))


  # Make the plot
  ggp <- ggplot(Data_Frame, aes(ymax=ymax, ymin=ymin, xmax=4, xmin=3, fill=`x`)) +
    geom_rect() +
    coord_polar(theta="y") + # Try to remove that to understand how the chart is built initially
    theme_void() +
    scale_fill_brewer(palette=4) +
    xlim(c(2, 4)) # Try to remove that to see how to make a pie chart

  print(ggp)
}
