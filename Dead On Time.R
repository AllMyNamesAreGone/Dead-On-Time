install.packages("readxl")
install.packages("forecast")
library(readxl)
library(forecast)

# Read data from each tab
economic_data <- read_excel("Dead On Time.xlsx", sheet = "Cleaned Data")

# Extract the columns that you want to apply auto.arima to
time_series_columns <- economic_data[, -1]  # Exclude the Date column

# Apply auto.arima to each column
arima_models <- lapply(time_series_columns, function(column) {
  # Convert the column to a time series object
  ts_data <- ts(column, start = 1, frequency = 1)
  
  # Apply auto.arima to the time series data
  arima_model <- auto.arima(ts_data)
  
  # Return the ARIMA model
  return(arima_model)
})

# Print the summary of each ARIMA model
for (i in seq_along(arima_models)) {
  cat("Column:", colnames(time_series_columns)[i], "\n")
  print(summary(arima_models[[i]]))
}

num_simulations <- 1000
forecast_periods <- 100

simulated_values <- list()

for (i in seq_along(arima_models)) {
  # Generate simulations for each ARIMA model
  simulations <- matrix(NA, nrow = num_simulations, ncol = forecast_periods)
  
  for (j in 1:num_simulations) {
    # Generate a simulated path using the forecast function
    sim_path <- simulate(arima_models[[i]], h = forecast_periods)
    
    # Store the simulated path
    simulations[j, ] <- sim_path
  }
  
  # Store the simulations for the current variable
  simulated_values[[i]] <- simulations
}





# Function to calculate percentage growth
calculate_percent_growth <- function(simulated_values) {
  percent_growth <- lapply(simulated_values, function(series) {
    growth <- diff(series) / head(series, -1) * 100
    return(growth)
  })
  return(percent_growth)
}

# Calculate percentage growth for each simulated variable
percent_growth <- calculate_percent_growth(simulated_values)

# Export the percent growth values to CSV or Excel
for (i in seq_along(percent_growth)) {
  # write.csv(simulated_values[[i]], file = paste0("simulations_", i, ".csv"), row.names = FALSE)
  write.csv(percent_growth[[i]], file = paste0("percent_growth_", i, ".csv"), row.names = TRUE)
}
