# BTC and search interest investigation

Created for Forge Data Science challenge 2021.

## Overview

The objective was to find some insights between [data for the price of Bitcoin](https://finance.yahoo.com/quote/BTC-USD/history?period1=1472688000&period2=1631491200&interval=1d&filter=history&frequency=1d&includeAdjustedClose=true) and [data for BTC searches](https://trends.google.com/trends/explore?date=today%205-y&q=bitcoin).

The hypothesis is that increases in bitcoin search interest are directly correlated to (or perhaps have time lag relationships with) the price of bitcoin. Because of the short timeframe, a mostly visual approach is adopted.

## Process

- Retrieve data from respective sources
    - Scrape google search data repeatadly (for periods of 5 years, Google only returns monthly data. Must retrieve multiple times to increase granularity).
- Clean data
    - Fill gaps using 30-day EMA
    - Convert search data from weekly to daily
- Process data
    - Calculate 30 and 100-day EMA for both price and search data
    - Weekly and Monthly %change for both price and search data
- Analysis
    - Simple linear regression
    - Visual interpretation

## Visualizations

![Price over time](images\BTCPriceGraph.png)
![Price over time](images\BTCSearchGraph.png)
![Price over time](images\BTCPriceGraphWeeklyDerivative.png)
![Price over time](images\CorrelationFacets.png)
![Price over time](images\ValueFacets.png)
![Price over time](images\PriceSearchesCorrelation.png)
![Price over time](images\DerivativeSearchesCorrelation.png)

## Conclusion

The results suggest negative relationship between the change in BTC momentum and search interest, and a positive correlation between BTC price momentum change and BTC search interest momentum change (column 3, row 3, slide 8).

A takeaway for investors could be that currently, the price momentum of BTC has significantly diverged from its relationship to public interest in BTC. This suggests that BTC price is “overvalued” if current search interest in BTC does not return to levels from earlier this year. Alternatively, it may suggest that the baseline value for BTC has increased, as the duration for which BTC was valued over $40,000 was very significant. 
