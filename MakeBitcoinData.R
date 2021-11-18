library(dplyr)
library(lubridate)
library(ggplot2)
library(hrbrthemes)
library(Cairo)
library(ggpubr)
library(tidyr)

# Import and clean the data for the price of BTC over time
price_data <- read.csv("BTC-USD.csv") %>% mutate(
  Date=ymd(Date),
  Price=as.integer(Open),
  Week=round_date(Date, unit="week") # Create a column 'week' for merging 
)                                    # with search data

# Import and clean the data for the searches for 'bitcoin' over time
search_data <- read.csv("BitcoinSearches.csv") %>% mutate(
  Week=mdy(Week)
)

bitcoin_data <- left_join( # Merge price and search data by week; duplicate search data
  price_data, search_data, by="Week", copy=TRUE
)

bitcoin_data <- bitcoin_data %>% mutate( # Compute moving averages (30 and 90 day)
  Price_MA30=zoo::rollapply(
    Price, 30, mean, na.rm=TRUE, partial=TRUE, align="left"),
  Price_MA100=zoo::rollapply(
    Price, 100, mean, na.rm=TRUE, partial=TRUE, align="left"),
  Search_MA30=zoo::rollapply(
    Searches, 30, mean, na.rm=TRUE, partial=TRUE, align="left"),
  Search_MA100=zoo::rollapply(
    Searches, 100, mean, na.rm=TRUE, partial=TRUE, align="left"),
)

bitcoin_data <- bitcoin_data %>% mutate( # Compute weekly percent change (derivative)
  Price_MA30_Change_Weekly=((Price_MA30/lag(Price_MA30)) - 1) * 100,
  Price_MA100_Change_Weekly=((Price_MA100/lag(Price_MA100)) - 1) * 100,
  Search_MA30_Change_Weekly=((Search_MA30/lag(Search_MA30)) - 1) * 100,
  Search_MA100_Change_Weekly=((Search_MA100/lag(Search_MA100)) - 1) * 100
)

bitcoin_data <- bitcoin_data %>% mutate( # Compute monthly percent change (derivative)
  Price_MA30_Change_Monthly=((Price_MA30/lag(Price_MA30, n=30)) - 1) * 100,
  Price_MA100_Change_Monthly=((Price_MA100/lag(Price_MA100, n=30)) - 1) * 100,
  Search_MA30_Change_Monthly=((Search_MA30/lag(Search_MA30, n=30)) - 1) * 100,
  Search_MA100_Change_Monthly=((Search_MA100/lag(Search_MA100, n=30)) - 1) * 100
)