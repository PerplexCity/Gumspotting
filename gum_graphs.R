library(ggplot2)
library(reshape2)

gumspots <- read.csv("~/Desktop/gumspots.csv")

#create labels, fonts, single column of spotcounts (for histogram)
streets <- c(20,30,40,50,60,70,80,90,100,110,120,130)
names <- as.character(streets)
names <- lapply(names, paste0, "th")
bbi <- element_text(face="bold.italic", color="black")
justspots <- data.frame(gumspots$SQ1, gumspots$SQ2, gumspots$SQ3, gumspots$SQ4, 
                        gumspots$SQ5, gumspots$SQ6, gumspots$SQ7, gumspots$SQ8, 
                        gumspots$SQ9, gumspots$SQ10, gumspots$SQ11, gumspots$SQ12, 
                        gumspots$SQ13, gumspots$SQ14, gumspots$SQ15, gumspots$SQ16)
stack <- melt(justspots, na.rm=T, value.name="spots")

#general gumspot graph
gumgraf <- ggplot(gumspots, aes(Start)) + 
  geom_line(aes(y=SQ.AVG, color = "Gumspots per Flag")) + 
  geom_line(aes(y=X5.BLK.SQAVG, color = "Smoothed"), size=1.3) + 
  scale_color_manual(values=c("Gumspots per Flag"="steelblue2", "Smoothed"="blue4")) +
  scale_x_continuous(breaks=streets, labels = names, limits=(c(15,130))) +
  labs (y="", x="Street", title="Gum on Park Avenue") + 
  theme(title=bbi, legend.title=element_blank())

#gumspot histogram
gumhist <- ggplot(stack, aes(x=spots)) + 
  geom_histogram(binwidth=1, fill=I("lightblue"), col=I("black")) +
  xlab("Spots") + ylab("Frequency") + 
  labs(title="Gumspots per Flag") +
  theme(legend.position='none', title=bbi)

#gumspots with per capita income overlaid
gumgraf2 <- ggplot(gumspots[41:100,], aes(Start)) + 
  geom_line(aes(y=SQ.AVG, color = "Gumspots per Flag")) + 
  geom_line(aes(y=X5.BLK.SQAVG, color = "Smoothed"), size=1.3) + 
  geom_line(aes(y=Per.Capita.Income/5000, color="Per Capita Income"), size=1.3) +
  scale_color_manual(values=c("Gumspots per Flag"="steelblue2", "Smoothed"="blue4", 
                              "Per Capita Income" = "olivedrab4")) +
  scale_x_continuous(breaks=streets, labels = names, limits=(c(60,120))) +
  labs (y="", x="Street", title="Gum on Park Avenue") +
  theme(title=bbi, legend.title=element_blank())

#fake graph to create second y-axis
#R is famously difficult to use for dual y-axes graphs 
#So I just scaled the PCI info down in the first graph ("/5000")
#And then just photoshopped the two together
gumgraf2a <- ggplot(gumspots[41:100,], aes(Start)) + 
  geom_line(aes(y=SQ.AVG), color="steelblue2") + 
  geom_line(aes(y=X5.BLK.SQAVG), colour="blue4", size=1.3) + 
  geom_line(aes(y=Per.Capita.Income), colour="darkolivegreen4", size=1.3) +
  scale_x_continuous(breaks=streets, labels = names, limits=(c(60,120))) +
  scale_y_continuous(breaks=c(50000,100000,150000,200000), labels = c("$50K", "$100K", "$150K", "$200K"))+
  labs (y="", x="Street", title="Gum on Park Avenue") +
  theme(legend.position='none', title=bbi)

#gumspots vs PCI
gumVmoney <- ggplot(gumspots[41:100,], aes(x=Per.Capita.Income, y=X5.BLK.SQAVG)) + 
  geom_point()+geom_smooth(method='lm',formula=y~x) +
  scale_x_continuous(breaks=c(50000,100000,150000,200000), labels = c("$50K", "$100K", "$150K", "$200K"))+
  labs (x="Per Capita Income", y="Gumspots per Flag", title="More Money, Less Spots") +
  theme(legend.position='none', title=bbi)
