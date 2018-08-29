#This dataset contains the hourly and daily count of rental bikes between years 2011 and 2012 in Capital bikeshare system with the corresponding weather and seasonal information.
#http://archive.ics.uci.edu/ml/datasets/Bike+Sharing+Dataset#

library(dplyr)
library(ggplot2)
library(readr)

bike_share_day <- read.csv('raw_data/bike_sharing/day.csv')

bike_share_simple <- bike_share_day %>%
  select(temp, casual, registered, season) %>%
  mutate(season = case_when(season == 1 ~ 'Spring',
                            season == 2 ~ 'Summer',
                            season == 3 ~ 'Fall',
                            season == 4 ~ 'Winter')) %>%
  rename(temperature = temp, casual_users = casual, registered_users =registered)

write_csv(bike_share_simple, "clean_data/bike_share_day_simple.csv")


bike_share_day %>%
  filter(season %in% c(2)) %>%
  ggplot(aes(x = temp, y = registered, colour = season)) + geom_point()

bike_share_day %>%
  ggplot(aes(x = temp, y = registered, colour = as.factor(weathersit))) + geom_point()


bike_plot <-bike_share_day %>%
  ggplot(aes(x = temp, y = registered)) + geom_point()


bike_share_day %>%
  mutate(all_users = casual + registered) %>%
  ggplot(aes(x = temp, y = all_users)) + geom_point()


bike_plot <-bike_share_day %>%
  ggplot() + geom_point(aes(x = temp, y = registered))

bike_plot %>% str()

bike_plot$mapping$x

bike_plot$mapping$y

bike_plot$layers[[1]]$mapping$x

bike_plot$layers[[1]]

objects(bike_plot$layers[[1]])

bike_plot$layers[[1]] %>% str()

class(bike_plot$layers[[1]])


class(bike_plot$layers[[1]]$geom)

class(bike_plot$layers[[1]]$geom)

bike_plot$layers

bike_plot$layers

length(bike_plot$layers)


pl <- ggplot_build(bike_plot)

pl$layout %>% str()

expect_that("package:rvest" %in% search() , is_true())


expect_that("temperature" %in% c(bike_plot$mapping$x, bike_plot$layers[[1]]$mapping$x) , is_true())
expect_that("total_users" %in% c(bike_plot$mapping$y, bike_plot$layers[[1]]$mapping$y) , is_true())
expect_that("GeomPoint" %in% c(class(bike_plot$layers[[1]]$geom)) , is_true())


library(testthat)
