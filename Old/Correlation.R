library(ggpmisc)

BTCformula <- y ~ x
g <- ggplot(data=bitcoin, aes(x=Searches*100, y=Open)) +
  geom_point(color="grey") +
  geom_smooth(method=lm, se=FALSE, color="red", size=0) +
  stat_poly_eq(formula=BTCformula, aes(label = paste(..eq.label.., ..rr.label.., sep = "~~~")), 
               parse = TRUE) +
  ggtitle("BTC Price vs Search Index") +
  xlab("Searches") +
  ylab("BTC Price ($)") +
  theme_ipsum()

print(g)