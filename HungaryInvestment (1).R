##############
# Hungary Investment Visualization
# 07/21/2022
# yuchengo@usc.edu
##############

# prep work
library(tidyverse)
library(ggplot2)
rm(list = ls())

#import data
dat <- read.csv("/Users/ag0115/Desktop/wdi_hungary.csv", check.names = F)
dat <- select(dat, c(1:50))
dat <- dat[102,]


datCleaned <- dat %>% 
  pivot_longer(names_to = "year", values_to = "Direct_Foreign_Investment", cols=-c(1,2,3,4))

#########
barPlot <- ggplot(data = subset(datCleaned, year %in% c(1989:2004)),aes(x=factor(year), y = Direct_Foreign_Investment, fill=factor(ifelse(year>1994,"After NATO base in Hungary","Previous Years"))))+
  geom_bar(stat="identity") +
  labs(title = "Direct Foreign Investment In Hungary From Year 1989-2004",
       subtitle = "Data Source: The World Bank",
       x = "Year",
       y = "Direct Foreign Investment")+
  scale_fill_manual(name = "", values=c("red","steelblue"))+
  scale_y_continuous(labels = scales::comma)
barPlot
