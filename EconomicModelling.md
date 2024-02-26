---
title: Economic Modelling
layout: template
filename: EconomicModelling
--- 
# Economic Modelling
The economic modelling framework employs a diverse suite of models designed to capture the intricacies of financial markets and macroeconomic indicators. Key components of our model portfolio include:

- **Global Stock Market:** Proxied by the FTSE All World index, an ARIMA(0,2,2) model is utilised to forecast trends & fluctuations in global stock markets. PACF & ACF indicates that this series is a Moving Average time series. ![image](https://github.com/AllMyNamesAreGone/Dead-On-Time/assets/39043485/100e17fe-2a76-4478-89f7-ed2b86d3ec1c)

- **Australian 10-Year Bond Rates:** Serving as a proxy for the Australian risk-free rate, a random walk model is utilised to analyse & predict movements in long-term bond rates.![image](https://github.com/AllMyNamesAreGone/Dead-On-Time/assets/39043485/6c9908e1-403c-4571-99be-9148b88fc6f7)

- **Cash Rate Targets:** Extracted from the Reserve Bank of Australia (RBA), a random walk model is utilised to forecast changes in the RBA's cash rate targets.![image](https://github.com/AllMyNamesAreGone/Dead-On-Time/assets/39043485/19f14f12-94b4-479e-a750-fe673eaad5ca)

- **General Commodities Market:** Represented by the Bloomberg Commodity index, the modelling approach employs a random walk model to capture & predict movements in the general commodities market.![image](https://github.com/AllMyNamesAreGone/Dead-On-Time/assets/39043485/a99f227b-d737-46fc-8cfe-ce32c73c3364)

- **Gold Market:** Utilising the Bloomberg Gold index, a random walk model with drift is implemented to analyse & forecast trends in the gold market.![image](https://github.com/AllMyNamesAreGone/Dead-On-Time/assets/39043485/2d82ca8f-cbe2-49c4-83d1-3064bbf97d9f)

- **Australian Property Market:** Measured through the Residential Property Price Index, the modelling framework incorporates a random walk model with drift to assess & predict movements in the Australian property market.![image](https://github.com/AllMyNamesAreGone/Dead-On-Time/assets/39043485/753401bb-812e-430b-851b-6f0d92751aab)

- **Inflation:** Monitored via the Consumer Price Index (CPI), inflation serves as a critical factor in the economic analysis. A simple mean model is applied to adjust nominal rates for inflationary pressures.![image](https://github.com/AllMyNamesAreGone/Dead-On-Time/assets/39043485/d5ba175a-bd53-4c33-914c-5ed54bc5d895)


_While the initial modelling assumptions treat these variables as independent, it is recognised the inherent correlations between many of these rates, particularly within the Australian context. To address this, VAR-GARCH models are being explored. These models aim to capture the interactions between time series variables, not only in the current period but also in preceding periods, providing a more comprehensive understanding of the dynamic economic landscape._



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
