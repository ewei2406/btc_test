library(gridExtra)
library(hrbrthemes)

bitcoin_price_daily <- bitcoin_price_daily %>% mutate(
  Rollmean30=zoo::rollapply(Open, 30, mean, na.rm=TRUE, partial=TRUE, align="left"),
  Rollmean100=zoo::rollapply(Open, 100, mean, na.rm=TRUE, partial=TRUE, align="left"),
)

bitcoin_price_daily_melted <- bitcoin_price_daily %>% pivot_longer(
  c("Open","Rollmean100", "Rollmean30"), values_to="NewPrice"
)

p <- ggplot(data=bitcoin_price_daily_melted, aes(x=Date, y=NewPrice, color=name)) +
  geom_line() +
  scale_color_manual(name="", 
                     values=c("grey", "black", "red"), 
                     labels=c("Price", "100-day MA", "30-day MA")) +
  ggtitle("Price of BTC over time") +
  ylab("Price ($)") +
  theme_ipsum()

print(p)