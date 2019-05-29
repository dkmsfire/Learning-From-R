#First, we'll create a fake dataset of 20 individuals of different body sizes:
bodysize=rnorm(20,30,2) # generates 20 values, with mean of 30 & s.d.=2
bodysize=sort(bodysize) # sorts these values in ascending order. 
survive=c(0,0,0,0,0,1,0,1,0,0,1,1,0,1,1,1,0,1,1,1) # assign 'survival' to these 20 individuals non-randomly... most mortality occurs at smaller body size
dat=as.data.frame(cbind(bodysize,survive)) # saves dataframe with two columns: body size & survival
dat # just shows you what your dataset looks like. It will look something like this:

### windows(title="bodysize vs. survival") # creates a quartz window with title

plot(bodysize,survive,xlab="Body size",ylab="Probability of survival") # plot with body size on x-axis and survival (0 or 1) on y-axis
g=glm(survive~bodysize,family=binomial,dat) # run a logistic regression model (in this case, generalized linear model with logit link). see ?glm

curve(predict(g,data.frame(bodysize=x),type="resp"),add=TRUE) # draws a curve based on prediction from logistic regression model

points(bodysize,fitted(g),pch=20) # optional: you could skip this draws an invisible set of points of body size survival based on a 'fit' to glm model. pch= changes type of dots.

library(popbio)
logi.hist.plot(bodysize,survive,boxp=FALSE,type="hist",col="gray")
