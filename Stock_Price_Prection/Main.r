library(readr)      
library(dplyr)       
library(ggplot2)     
library(zoo)        
library(lubridate)   
library(caret)      
library(TTR)
library(tidyr) 


df <- read.csv(file.choose())

str(df)
tail(df)
colnames(df)
summary(df)


df$Date <- as.Date(df$Date)

x <- df %>% select(Date)  
y <- df$Adj.Close        


dim(x)
dim(y)

ggplot(df, aes(x = Date, y = Adj.Close)) +
  geom_line() +
  labs(title = "Apple Stocks Trend", x = "Date", y = "Adjusted Close Price") +
  theme_minimal()

start_date <- as.Date("1980-12-12")
end_date <- as.Date("2022-06-17")
df_filtered <- df %>%
  filter(Date >= start_date & Date <= end_date)

df_filtered <- df_filtered %>%
  mutate(SMA_30_days = rollmean(Adj.Close, k = 30, fill = NA, align = "right"),
         EMA_20_days = TTR::EMA(Adj.Close, n = 20))

df_filtered <- df_filtered %>% drop_na(SMA_30_days, EMA_20_days)


ggplot(df_filtered, aes(x = Date)) +
  geom_line(aes(y = Adj.Close, color = "Adjusted Closing Price"), linewidth = 1) +
  geom_line(aes(y = SMA_30_days, color = "30 days SMA"), linewidth = 1) +
  geom_line(aes(y = EMA_20_days, color = "20 days EMA"), linewidth = 1) +
  labs(title = "Historical Stock Prices of Apple [1980-12-12 to 2022-06-17]",
       x = "Date", y = "Price") +
  scale_color_manual(values = c("black", "red", "blue")) +
  theme_minimal() +
  theme(legend.position = "top")


df$Volume <- as.numeric(df$Volume)  
X <- df %>% select(Volume)          
y <- df$Close                         

model <- lm(y ~ Volume, data = df)

y_pred <- predict(model, newdata = df)


df_new <- data.frame(Actual_Output = y, Predicted_Output = y_pred)


head(df_new)

r2 <- summary(model)$r.squared
print(r2)


new_volume <- data.frame(Volume = 23699200)
predicted_value <- predict(model, newdata = new_volume)
print(predicted_value)

coef(model)

X1 <- df %>% select(Open, High, Low, Adj.Close, Volume)
y1 <- df$Close

model_multiple <- lm(y1 ~ ., data = X1)

y1_pred <- predict(model_multiple)

r2_multiple <- summary(model_multiple)$r.squared
print(r2_multiple)

ggplot() +
  geom_point(aes(x = y1, y = y1_pred)) +
  labs(title = "Actual vs Predicted Prices", x = "Actual Prices", y = "Predicted Prices") +
  theme_minimal()

coef(model_multiple)