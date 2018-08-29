
## House prices in the seattle region from May 2014 to May 2015
##https://github.com/Shreyas3108/house-price-prediction

house_price <- read_csv("raw_data/kc_house_data.csv")


house_small <- house_price %>%
  select(price, sqft_living, sqft_basement)

write_tsv(house_small, path = "clean_data/seattle_house.tsv")

house_price %>%
  ggplot(aes(x = sqft_living, y = price, colour = as.factor(waterfront))) + geom_point()


house_price %>%
  ggplot(aes(x = long, y = lat, colour = price)) + geom_point()
