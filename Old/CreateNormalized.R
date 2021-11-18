p <- ggplot(bitcoin_melted, aes(x=Date, y=Score, color=name)) +
  geom_line() +
  scale_color_discrete(name="") +
  ggtitle("Bitcoin Price and Number of Searches (normalized) over time") +
  theme_ipsum()

print(p)