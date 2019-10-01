### example 1
set.seed(0815)
x <- 1:10
F <- runif(10,1,2) 
L <- runif(10,0,1)
U <- runif(10,2,3)

require(plotrix)
plotCI(x, F, ui=U, li=L)

### example 2
set.seed(0815)
df <- data.frame(x = 1:10,
                 F = runif(10,1,2),
                 L = runif(10,0,1),
                 U = runif(10,2,3))

require(ggplot2)

df$x = c("a", "b", "c", "d", "e", "f", "g", "h", "i", "j")

ggplot(df, aes(x = x, y = F)) +
  geom_point(size = 4) +
  geom_errorbar(aes(ymax = U, ymin = L)) +
  geom_hline(aes(yintercept = df$F[1]))

