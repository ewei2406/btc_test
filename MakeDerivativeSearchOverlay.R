# Graph of bitcoin derivative price data with Searches overlayed
d <- ggplot(data=bitcoin_data, aes(x=Date, y=Price_MA100_Change_Weekly)) +
  geom_ribbon(aes(x=Date, ymax=(Searches / 100), ymin=0), 
              fill="grey", col="grey", size=0, alpha=0.6) +
  geom_ribbon(
    aes(ymin=pmin(Price_MA100_Change_Weekly,0), ymax=0), 
    fill="red", col="black", alpha=0.2, size=0.2) +
  geom_ribbon(
    aes(ymin=0, ymax=pmax(Price_MA100_Change_Weekly,0)), 
    fill="green", col="black", alpha=0.2, size=0.2) +
  labs(color="legend") +
  ggtitle("Weekly % Change in Bitcoin 100-day MA with Search Index Overlay") +
  ylab("Percent Change (%)") +
  theme_ipsum()

ggsave(d, filename = './images/BTCPriceGraphWeeklyDerivative.png', dpi = 300, type = 'cairo', bg="white",
       width = 8, height = 5, units = 'in')