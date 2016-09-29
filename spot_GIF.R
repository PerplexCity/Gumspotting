spotsim <- read.csv("~/Desktop/spotsim.csv", nrows=47)
spots <- data.frame(x=randogum$x, y=randogum$y, z=0.5*randogum$size)
#change row limit from 1 up to 56 (all) to get spot-by-spot graphs
ggplot(spotsim[1:47,], aes(x=posx, y=posy)) + geom_point(size=spotsim$radius[1:47]) + 
  scale_y_continuous(breaks=NULL, limits=(c(0,10))) + 
  scale_x_continuous(breaks=NULL, limits=(c(0,10))) + 
  labs(x="", y="")