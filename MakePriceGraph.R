bitcoin_price_data <- bitcoin_data %>% pivot_longer( # Melt the data to plot
  c("Price", "Price_MA30", "Price_MA100"),
  names_to="Price_Type",
  values_to="Price"
)

# Graph of bitcoin price data (provide overview)
p <- ggplot(data=bitcoin_price_data, aes(x=Date, y=Price, color=Price_Type)) +
  geom_line() +
  ggtitle("Price of Bitcoin over time") +
  ylab("Price ($)") +
  scale_color_manual(
    name="", 
    values=c("#aaaaaa66", "#000000aa", "#ff0000aa"), 
    labels=c("Price", "100 Day MA", "30 Day MA"),
    guide=guide_legend(override.aes=list(alpha=1)) # Fix a graphical bug
    ) +
  theme_ipsum()

ggsave(p, filename = './images/BTCPriceGraph.png', dpi = 300, type = 'cairo', bg="white",
       width = 8, height = 5, units = 'in')

