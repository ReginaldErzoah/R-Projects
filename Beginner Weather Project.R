# Load required packages
library(readr)
library(dplyr)
library(ggplot2)

# Import the data
weather_data <- read_csv("weatherHistory.csv")


# Data Summary
summary(weather_data)

# Calculate the average temperature per year
Avg_Yearly_Temp <- weather_data %>%
  mutate(
    Date = as.Date(`Formatted Date`),
    Year = format(Date,"%Y")
  )%>%
  group_by(Year)%>%
  summarise(Avg_Temp = mean(`Temperature (C)`, na.rm = TRUE))

# View the Summary
print(Avg_Yearly_Temp)

# Plot the average temperature per year as a bar chart
ggplot(Avg_Yearly_Temp,aes(x= Year, y=Avg_Temp))+
  geom_bar(stat = "identity",fill="blue")+
  labs(
    title = "Average Yearly Temperature",
    x = "Year",
    y = "Average Temperature (C)"
  )