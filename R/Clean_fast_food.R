library(dplyr)
library(ggplot2)
library(readr)


fast_food <- read.csv("raw_data/FastFoodRestaurants.csv")


fast_food %>% head()

fast_food$province %>% unique()

clean_fast_food <- fast_food %>%
  select(name, province)

clean_fast_food %>% head()

write.csv(clean_fast_food, "clean_data/fast_food_usa.csv",row.names = FALSE)

fast_food %>%
  group_by(name) %>%
  summarise(n = n()) %>%
  arrange(desc(n)) %>%
  slice(9:14)


fast_food$name %>% unique()

fast_food %>%
  filter(province %in% c("CA", "WA", "OR")) %>%
  filter(name %in% c("McDonald's", "Burger King", "Taco Bell",
                     "Wendy's", "Arby's", "KFC", "Domino's Pizza", "Subway")) %>%
  ggplot(aes(x = province, fill = name)) + geom_bar(colour = 'black')

dodge_plot <- fast_food %>%
  filter(province %in% c("CA", "WA", "OR")) %>%
  filter(name %in% c("McDonald's", "Burger King", "Taco Bell",
                     "Wendy's", "Arby's", "KFC", "Domino's Pizza", "Subway")) %>%
  ggplot(aes(x = province, fill = name)) + geom_bar(position = 'dodge')


dodge_plot$layers[[1]]$position %>% str()

"PositionDodge" %in% class(dodge_plot$layers[[1]]$position)

total_restaurants <- clean_fast_food  %>%
  filter(province %in% c("CA", "WA", "OR")) %>%
  filter(name %in% c("McDonald's", "Burger King", "Taco Bell",
                     "Wendy's", "Arby's", "KFC", "Domino's Pizza", "Subway")) %>%
  group_by(province) %>%
  summarise(total_restaurants = n())

clean_fast_food  %>%
  filter(province %in% c("CA", "WA", "OR")) %>%
  filter(name %in% c("McDonald's", "Burger King", "Taco Bell",
                     "Wendy's", "Arby's", "KFC", "Domino's Pizza", "Subway")) %>%
  group_by(province, name) %>%
  summarise(restaurants = n()) %>%
  left_join(total_restaurants) %>%
  mutate(proportion_restaurants = restaurants/total_restaurants) %>%
  ggplot(aes(x = province, fill = name, y = proportion_restaurants)) + geom_bar(stat = 'identity')

