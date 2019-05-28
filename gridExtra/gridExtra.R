### in ggplot2, we can't use par(mfrow = c(1,1)), this kind of command to get a combine plot.
### so, I find that maybe we can use gridExtra to do this trick.
### here is a example to display this situaion.
### besides, using gridExtra, we need to use lapply function.

library("ggplot2")
library("gridExtra")
pl <- lapply(1:4, function(.x) qplot(1:10, rnorm(10), main=paste("plot", .x)))
marrangeGrob(pl, nrow=2, ncol=2)
