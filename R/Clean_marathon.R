library(dplyr)
library(ggplot2)
library(readr)

marathon_all <- read.csv("raw_data/marathon_raw/Sheet1-Table 1.csv")

marathon_simple_week1 <- marathon_all %>%
  select(age, bmi, k5_ti, k10_ti) %>%
  dplyr::rename(age = age, bmi = bmi, km5_time_seconds = k5_ti, km10_time_seconds = k10_ti) %>%
  filter(!is.na(km5_time_seconds) | !is.na(km10_time_seconds))

write_csv(marathon_simple_week1, "clean_data/marathon_simple_week1.csv")

marathon_all %>%
  ggplot(aes(x = bmi, y = k5_ti, colour = female)) + geom_point()

