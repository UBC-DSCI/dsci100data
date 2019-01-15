##### sea water levels
#### http://www.pac.dfo-mpo.gc.ca/science/oceans/data-donnees/lightstations-phares/index-eng.html

library(tidyr)
library(dplyr)
library(ggplot2)
library(readr)
library(lubridate)

sea_surface_t <- read_csv("raw_data/Temperature_salinity_departure.csv")

Temperature_data <- sea_surface_t %>%
  select(Year, Month, Day, Temperature_C)

Minimum_temperature_data <- Temperature_data %>%
  group_by(Year, Month) %>%
  summarise(min_t = min(Temperature_C, na.rm = TRUE)) %>%
  mutate(min_t = ifelse(is.infinite(min_t), NA, min_t)) %>%
  mutate(Month = month(Month, label = TRUE, abbr = TRUE)) %>%
  spread(key = Month, value = min_t)

write_csv(Minimum_temperature_data, path = "clean_data/Min_temperature.csv")

Minimum_temperature_data %>%
  select(Year, Jan, Feb, Mar) %>%
  gather(key = 'Month', value = 'Temperature', -Year) %>%
  ggplot(aes(x = Year, y = Temperature, colour = Month)) + geom_point()


Salinity_data <- sea_surface_t %>%
  select(Year, Month, Day, Salinity_psu)

Max_salinity_data <- Salinity_data  %>%
  group_by(Year, Month) %>%
  summarise(max_sal = max(Salinity_psu, na.rm = TRUE)) %>%
  mutate(max_sal = ifelse(is.infinite(max_sal), NA, max_sal)) %>%
  mutate(Month = month(Month, label = TRUE, abbr = TRUE)) %>%
  spread(key = Month, value = max_sal)

write_csv(Max_salinity_data, path = "clean_data/Max_salinity.csv")


