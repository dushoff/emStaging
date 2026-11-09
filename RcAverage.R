library(shellpipes)
library(ggplot2); theme_set(theme_bw())
library(patchwork)
loadEnvironments()

startGraphics(height=3)

label_wrap <- function(wrap_level) {
  sapply(wrap_level,function(x){
    paste("R0 =",x)
  })}

rcHistplot <- rdsRead("rcHist")
 
print(rcHistplot + theme(legend.position = "none"))

