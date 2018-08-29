##### sea water levels
#### http://www.pac.dfo-mpo.gc.ca/science/oceans/data-donnees/lightstations-phares/index-eng.html

library(tidyr)
library(dplyr)
library(ggplot2)
library(readr)

sea_surface_t <- read_csv("raw_data/Sea_Surface_Temperatures.csv")

sea_surface_t %>% str()

sea_surface_t %>%
  ggplot(aes(x= Year, y = Jan)) + geom_point()

sea_surface_t %>%
  mutate(Mean_annual_t = rowMeans(select(sea_surface_t, Jan:Dec), na.rm  = TRUE)) %>%
  ggplot(aes(x = Year, y = Mean_annual_t)) + geom_point()

sea_surface_t %>%
  gather(key = 'Month', value = 'Temperature', -Year)

sea_surface_t %>%
  gather(key = 'Month', value = 'Temperature', Jan:Dec) %>%
  ggplot(aes(x = Year, y = Temperature)) + geom_point()

sea_surface_t %>%
  gather(key = 'Month', value = 'Temperature', Jan:Dec) %>%
  ggplot(aes(x = Year, y = Temperature, colour = Month)) + geom_point()

sea_surface_t %>%
  gather(key = 'Month', value = 'Temperature', Jan:Dec) %>%
  mutate(Month = factor(Month, levels = c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"))) %>%
  ggplot(aes(x = Year, y = Temperature, colour = Month)) + geom_point() + geom_smooth()


