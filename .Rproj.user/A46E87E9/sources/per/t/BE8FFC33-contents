bitcoin_search_data <- bitcoin_data %>% pivot_longer( # Melt the data to plot
  c("Searches", "Search_MA30", "Search_MA100"),
  names_to="Search_Type",
  values_to="Searches"
)

# Graph of bitcoin search data (provide overview)
p <- ggplot(data=bitcoin_search_data, aes(x=Date, y=Searches, color=Search_Type)) +
  geom_line() +
  ggtitle("Searches for Bitcoin over time") +
  ylab("Searches (Google Search Index)") +
  scale_color_manual(
    name="", 
    values=c("#000000aa", "#ff0000aa", "#aaaaaa66"), 
    labels=c("100 Day MA", "30 Day MA", "Searches"),
    guide=guide_legend(override.aes=list(alpha=1)) # Fix a graphical bug
    ) +
  theme_ipsum()

ggsave(p, filename = './images/BTCSearchGraph.png', dpi = 300, type = 'cairo', bg="white",
       width = 8, height = 5, units = 'in')