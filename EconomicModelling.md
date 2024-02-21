---
title: Economic Modelling
layout: template
filename: EconomicModelling
--- 
# Economic Modelling
A suite of economic models are employed to capture the complexity of financial markets and macroeconomic indicators. Key models include:
- Global stock market proxied via FTSE All World index. ARIMA(0,2,2) model.
- Australian 10 year Bond rates proxies the Australian risk-free rate. Random walk model.
- Cash Rate Targets extracted via RBA. Random walk model.
- General commodities market proxied via Bloomberg Commodity. Random walk model.
- Gold market proxied via Bloomberg Gold. Random walk model with drift.
- Australian property market measured via Residential Property Price Index. Random walk model with drift.
- Inflation measured by CPI. Used to adjust nominal rates above for inflation. Simple mean model
