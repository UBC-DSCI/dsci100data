library(dplyr)
library(ggplot2)
library(readr)
library(lubridate)
library(purrr)

madrid_2001 <- read.csv("raw_data/air-quality-madrid/csvs_per_year/madrid_2001.csv")
madrid_2002 <- read.csv("raw_data/air-quality-madrid/csvs_per_year/madrid_2002.csv")
madrid_2003 <- read.csv("raw_data/air-quality-madrid/csvs_per_year/madrid_2003.csv")
madrid_2004 <- read.csv("raw_data/air-quality-madrid/csvs_per_year/madrid_2004.csv")
madrid_2005 <- read.csv("raw_data/air-quality-madrid/csvs_per_year/madrid_2005.csv")
madrid_2006 <- read.csv("raw_data/air-quality-madrid/csvs_per_year/madrid_2006.csv")
madrid_2007 <- read.csv("raw_data/air-quality-madrid/csvs_per_year/madrid_2007.csv")


madrid_pollution <- bind_rows(filter(madrid_2001, station == 28079035),
          filter(madrid_2002, station == 28079035),
          filter(madrid_2003, station == 28079035),
          filter(madrid_2004, station == 28079035),
          filter(madrid_2005, station == 28079035),
          filter(madrid_2006, station == 28079035),
          filter(madrid_2007, station == 28079035)) %>%
  mutate(date = ymd_hms(date)) %>%
  mutate(year = year(date), month = month(date, label = TRUE, abbr = FALSE)) %>%
  select(-station, -PM25)


write_csv(madrid_pollution, path = "clean_data/madrid_pollution.csv")

madrid_pollution %>%
  ggplot(aes(x = date, y = CO)) + geom_point()

madrid_pollution %>%
  group_by(year, month) %>%
  summarise(max_co = max(CO, na.rm = TRUE)) %>%
  ggplot(aes(x = year, y = max_co)) + geom_point()

madrid_pollution %>%
  filter(year == 2001) %>%
  select(-date, -year, -month) %>%
  map(~ max(., na.rm  = TRUE))

madrid_pollution %>%
  filter(year == 2006) %>%
  select(-date, -year, -month) %>%
  map(~ max(., na.rm  = TRUE))



