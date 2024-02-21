---
title: 1. Home
layout: template
filename: index
--- 
# Dead On Time
An actuarial iteration to traditional personal-line financial tools for the Financial Independence Retire Early (FIRE) movement.

## Elevator Pitch
- Traditional FIRE models often oversimplify financial forecasting by assuming constant rates over time.
- This tool uses historical data to generate the probability various outcomes, providing a more comprehensive view with risk explicitly expressed.
- Tailored towards Australian-specific factors like inflation, cash, bond rates, and global stock rates.
- Caters to the two-tier Superannuation retirement setup in Australia.
- Integrates a mortality component, predicting the likelihood of being liquid, broke, or dead.
- Stretch goals include implementing Optimal Portfolio Distribution and integrating with monthly income/expenses/savings summaries.

## Financial Modelling
The tool separates net worth into assets and liabilities, allowing for a more granular analysis of financial health. Different optimal asset allocations are prescribed for Super and non-Super funds, reflecting the distinct risks acceptance, characteristics and regulations of each. The modelling approach considers various factors, including spending flexibility, implicit wage growth, and the inclusion of the primary place of residence (PPOR) as a potential income-generating asset. There are uplifts and refinements of the models to improve accuracy and relevance in the pipeline.

## Economic Modelling
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

## Tableau Visualisation (WIP)
[Dead On Time](https://public.tableau.com/views/DeadOnTime/DeadOnTime?:language=en-GB&publish=yes&:display_count=n&:origin=viz_share_link)

### Improvements and Future Directions
**Asset and Liability Segmentation:**
- Separate net worth into distinct categories of assets and liabilities for clearer financial analysis.

**Tailored Asset Allocation:**
- Customize optimal asset allocations for superannuation and non-superannuation funds to align with individual goals and risk tolerance.

**Integration with VAR Model:**
- Utilize a Vector Autoregression (VAR) model to integrate various financial models and enhance the overall forecasting accuracy.

**Dynamic Spending Modeling:**
- Implement dynamic spending models to accommodate changes in financial needs and lifestyle preferences throughout retirement.

**Income Growth Projection:**
- Enhance income level projections by incorporating implicit wage growth factors for a more realistic financial outlook.

**Granular Property Investment Analysis:**
- Improve granularity in property investment analysis to provide more detailed insights into real estate assets.

**Flexibility in Spending Patterns:**
- Introduce flexibility in spending patterns to adapt to changing financial circumstances and individual preferences.

**Customized Superannuation Planning:**
- Tailor superannuation planning by considering individual circumstances rather than relying on a standard percentage of net worth.

**Inclusion of Primary Residence:**
- Consider including the primary residence in financial planning to explore potential income-generating opportunities such as Home Equity Line of Credit (HELOC) or Reverse Mortgage.
