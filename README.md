# Stock Price Analysis and Prediction with R

This project analyzes Apple Inc.'s historical stock price data and performs stock price prediction using Linear Regression and Multiple Linear Regression. The analysis includes trend visualization, moving averages, and statistical modeling.

## Requirements
### R Libraries
<ul>readr - For reading CSV files.</ul>
<ul>dplyr - For data manipulation.</ul>
<ul>ggplot2 - For data visualization.</ul>
<ul>zoo - For calculating moving averages.</ul>
<ul>lubridate - For date handling.</ul>
<ul>caret - For machine learning tasks.</ul>
<ul>TTR - For exponential moving averages. </ul>
<ul>tidyr - For data tidying. </ul>

**Install these libraries using:**

install.packages(c("readr", "dplyr", "ggplot2", "zoo", "lubridate", "caret", "TTR", "tidyr"));

## Workflow
### 1. Data Preparation
Input: A CSV file containing Apple stock data (with columns such as Date, Open, High, Low, Close, Adj.Close, and Volume).
Steps:
Load and preview data using str(), tail(), colnames(), and summary().
Convert the Date column to date format.
### 2. Trend Analysis
Plot the Adjusted Close Prices over time.
Filter data within the range 1980-12-12 to 2022-06-17.
Calculate and plot:
30-day Simple Moving Average (SMA).
20-day Exponential Moving Average (EMA).
### 3. Linear Regression Model
Objective: Predict stock prices based on Volume.
Steps:
Fit a linear regression model using lm(y ~ Volume, data = df).
Predict prices for existing and new volume values.
Evaluate the model using R-squared.
### 4. Multiple Linear Regression Model
Objective: Predict stock prices using multiple features:
Open, High, Low, Adj.Close, and Volume.
Steps:
Fit the model using lm(y1 ~ ., data = X1).
Predict stock prices and calculate R-squared.
Visualize Actual vs Predicted Prices.

## Key Outputs
### Visualizations:
Stock price trend with SMA and EMA.
Scatter plot for actual vs predicted prices.
### Metrics:
Coefficients of both models.
R-squared values for linear and multiple regression models.
### Predictions:
Stock price predictions for specific volume values.

## How to Run

1.Place the stock price CSV file in an accessible location.<br>
2.Run the R script line by line in your R environment (e.g., RStudio).<br>
3.When prompted by file.choose(), select the stock price CSV file.<br>

## Notes
Ensure the CSV file contains relevant columns: Date, Open, High, Low, Close, Adj.Close, and Volume.<br>
Handle any missing or invalid data before running the script.
## Results
Visual and statistical insights into Apple Inc.'s stock price trends.<br>
Predictive models to estimate future stock prices based on historical data.
