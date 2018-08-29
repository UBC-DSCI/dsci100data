#Data from Vickers, AJ & Vertosick, EA An empirical study of race times in recreational endurance runners.
#BMC Sports Science, Medicine and Rehabilitation 8, 26 (2016).
#https://bmcsportsscimedrehabil.biomedcentral.com/articles/10.1186/s13102-016-0052-y

library(dplyr)
library(ggplot2)
library(readr)

marathon_all <- read.csv("raw_data/marathon_raw/Sheet1-Table 1.csv")

marathon_simple_week1 <- marathon_all %>%
  select(age, bmi, k5_ti, k10_ti, female) %>%
  dplyr::rename(age = age, bmi = bmi, km5_time_seconds = k5_ti, km10_time_seconds = k10_ti, sex = female) %>%
  filter(!is.na(km5_time_seconds) | !is.na(km10_time_seconds)) %>%
  mutate(sex = ifelse(sex == 1, 'female', 'male'))

write_csv(marathon_simple_week1, "clean_data/marathon_simple_week1.csv")

marathon_all %>%
  ggplot(aes(x = bmi, y = k5_ti, colour = female)) + geom_point()

marathon_female <- marathon_simple %>%
  filter(sex == 'female') %>%
  select(bmi, km5_time_seconds)

marathon_female_minutes <- mutate(marathon_female, km5_time_minutes = km5_time_seconds/60)


read_csv("clean_data/marathon_simple_week1.csv")
