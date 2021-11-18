library(xts)
library(dplyr)
library(ggplot2)
library(zoo)

bitcoin_price_daily_change <- bitcoin_price_daily %>% mutate(
  PercentChange = (((Rollmean/lag(Rollmean)) - 1) * 100)
)

p <- ggplot(data=bitcoin_price_daily_change, aes(x=Date, y=PercentChange)) +
  geom_line() +
  theme_light() +
  ggtitle("Percent change in mean weekly BTC price over time") +
  ylab("Percent Change (%)")

print(p)