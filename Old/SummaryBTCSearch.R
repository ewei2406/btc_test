q <- ggplot(data=bitcoin_search, aes(x=Date, y=Searches)) +
  geom_line() +
  theme_light() +
  ggtitle("Searches for 'bitcoin' over time") +
  ylab("Google Search Score")

g <- grid.arrange(p,q, ncol=2)