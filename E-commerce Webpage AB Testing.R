#Install & load 'diplyr' for data manipulation & 'ggplot2' for visualization

install.packages(c("dplyr","ggplot2"))
library(dplyr)
library(ggplot2)

#Import CSV data file into R

{r}
data <- read.csv("C:/Users/THE SKRYBLA/Desktop/Media/PROJECTS/R Projects/ab_data.csv")

#Explore data before A/B Testing

{r}
head(data)
summary(data)


#Find Conversion rates per group

{r}
 conversion_rates <- data %>%
 group_by(group) %>%
 summarise(conversion_rates = mean(converted) * 100)
print(conversion_rates)

#Visualize Conversion Rates using bar plot

{r}
ggplot(conversion_rates, aes(x=group,y=conversion_rates,fill=group))+geom_bar(stat="identity") + labs(title="Conversion Rates by Group",x="Group",y="Conversion Rate(%)")

#Use Chi-square to compare the conversion rates.

#Create a contingency table

{r}
contingency_table <- table(data$group, data$converted)

#Perform Chi-square test

{r}
test_result<-chisq.test(contingency_table)
print(test_result)
