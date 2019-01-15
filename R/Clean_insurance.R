library(dplyr)
library(ggplot2)
library(readr)


insurance <- read.csv("raw_data/insurance.csv")

insurance %>% head()


insurance %>%
  ggplot(aes(x = bmi, y =  charges, colour = region)) + geom_point()

insurance %>%
  ggplot(aes(x = sex, fill = smoker)) + geom_bar()


