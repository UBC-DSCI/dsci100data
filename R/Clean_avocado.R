### avocado data
##https://www.kaggle.com/neuromusic/avocado-prices

#Numerical column names refer to price lookup codes.

#4046: small Hass
#4225: large Hass
#4770: extra large Hass

avocado <- read.csv("raw_data/avocado.csv")

avocado %>% head()

avocado_prices <- avocado %>%
  select(-X, -Date, -year, -Total.Bags, -Small.Bags, -Large.Bags, -XLarge.Bags, -Total.Volume) %>%
  rename(small_hass_volume = X4046, large_hass_volume = X4225, extra_l_hass_volume = X4770, average_price = AveragePrice)

write_csv(avocado_prices, "clean_data/avocado_prices.csv")


avocado_prices %>%
  mutate(total_volume = small_hass_volume + large_hass_volume + extra_l_hass_volume) %>%
  ggplot(aes(x = total_volume, y = average_price)) + geom_point() + scale_x_log10()


avocado_prices %>%
  mutate(total_volume = small_hass_volume + large_hass_volume + extra_l_hass_volume) %>%
  group_by(region) %>%
  summarise(mean_price_region = mean(average_price), mean_volume_region = mean(total_volume)) %>%
  ggplot(aes(x = mean_volume_region, y = mean_price_region)) + geom_point() + scale_x_log10()



##### For clustering

avocado_prices %>%
  mutate(total_volume = small_hass_volume + large_hass_volume + extra_l_hass_volume) %>%
  ggplot(aes(x = total_volume, y = average_price, colour = type)) + geom_point() + scale_x_log10()
