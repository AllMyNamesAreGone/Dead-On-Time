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

**This assumes independent variables. In reality many of these rates (especially Australian rates) will be correlated to each other. VAR-GARCH models are being explored to account for such interactions between time series variables not only in current time, but in previous periods as well.**

```
Column: FTSE All World 
Series: ts_data 
ARIMA(0,2,2) 

Coefficients:
          ma1     ma2
      -1.1032  0.5984
s.e.   0.2182  0.2422

sigma^2 = 1793:  log likelihood = -87.5
AIC=181   AICc=182.85   BIC=183.5

Training set error measures:
                   ME    RMSE      MAE     MPE
Training set 3.757369 37.6205 30.00522 2.50892
                 MAPE      MASE       ACF1
Training set 11.08228 0.8513959 0.03718014
Column: AU 10-Yr Bond Yield 
Series: ts_data 
ARIMA(0,1,0) 

sigma^2 = 0.9374:  log likelihood = -33.28
AIC=68.56   AICc=68.74   BIC=69.73

Training set error measures:
                     ME      RMSE       MAE
Training set -0.1231536 0.9486122 0.7223664
                  MPE     MAPE      MASE
Training set -7.28807 23.39129 0.9603808
                   ACF1
Training set -0.1843379
Column: RBA Cash Rate Target 
Series: ts_data 
ARIMA(0,1,0) 

sigma^2 = 1.164:  log likelihood = -35.87
AIC=73.75   AICc=73.93   BIC=74.93

Training set error measures:
                  ME     RMSE       MAE       MPE
Training set -0.0258 1.057001 0.7449609 -31.52632
                 MAPE      MASE      ACF1
Training set 48.44513 0.9602578 0.0847086
Column: Bloomberg Commodity 
Series: ts_data 
ARIMA(0,1,0) 

sigma^2 = 712.3:  log likelihood = -112.88
AIC=227.75   AICc=227.94   BIC=228.93

Training set error measures:
                      ME    RMSE      MAE
Training set -0.09618862 26.1503 20.36595
                   MPE     MAPE      MASE
Training set -1.277008 12.44885 0.9602774
                  ACF1
Training set -0.291239
Column: Bloomberg Gold 
Series: ts_data 
ARIMA(0,1,0) with drift 

Coefficients:
       drift
      9.4129
s.e.  3.7812

sigma^2 = 358.1:  log likelihood = -104.11
AIC=212.22   AICc=212.8   BIC=214.58

Training set error measures:
                      ME     RMSE      MAE
Training set 0.002745464 18.14977 14.33872
                   MPE     MAPE      MASE
Training set -1.260659 9.085957 0.8616568
                   ACF1
Training set -0.2003857
Column: RPPI ABS 
Series: ts_data 
ARIMA(0,1,0) with drift 

Coefficients:
       drift
      5.0235
s.e.  1.6417

sigma^2 = 48.68:  log likelihood = -56.63
AIC=117.26   AICc=118.12   BIC=118.93

Training set error measures:
                      ME     RMSE      MAE
Training set 0.003682024 6.578141 5.391264
                   MPE     MAPE      MASE
Training set 0.3976067 6.705292 0.7848974
                   ACF1
Training set -0.1576647
Column: CPI 
Series: ts_data 
ARIMA(0,0,0) with non-zero mean 

Coefficients:
        mean
      2.8320
s.e.  0.2823

sigma^2 = 2.076:  log likelihood = -44.09
AIC=92.18   AICc=92.73   BIC=94.62

Training set error measures:
                       ME     RMSE    MAE
Training set 1.065337e-16 1.411586 0.9424
                   MPE    MAPE      MASE      ACF1
Training set -21.20003 38.9163 0.8567273 0.2837769
```
