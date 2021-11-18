library(ggplot2)
library(dplyr)
library(tidyr)
library(lubridate)

bitcoin_price_daily <- read.csv("BTC-USD.csv")

bitcoin_price_daily$Date <- ymd(bitcoin_price_daily$Date)
bitcoin_price_daily$Open <- as.integer(bitcoin_price_daily$Open)

bitcoin_price_daily <- bitcoin_price_daily %>% mutate(
  Price = Open / max(bitcoin_price_daily$Open, na.rm=T)
)

bitcoin_search <- read.csv("BitcoinSearches.csv")

bitcoin_search$Date <- mdy(bitcoin_search_weekly$Week)
bitcoin_search_weekly$Searches <- as.integer(bitcoin_search$Searches) / 100

bitcoin <- inner_join(bitcoin_search_weekly, bitcoin_price_daily, by=c("Date"))
bitcoin_melted <- bitcoin %>% pivot_longer(c("Price", "Searches"), values_to="Score")
