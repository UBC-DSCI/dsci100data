##https://data.pacificclimate.org/portal/pcds/map/

1101300
station_fort_st_john <- read_delim("raw_data/EC/11814FR.ascii", delim = ",", skip = 1) %>%
  mutate(ONE_DAY_RAIN = as.numeric(ONE_DAY_RAIN),
         MIN_TEMP = as.numeric(MIN_TEMP),
         ONE_DAY_SNOW = as.numeric(ONE_DAY_SNOW),
         time = as.Date(time),
         SNOW_ON_THE_GROUND = as.numeric(SNOW_ON_THE_GROUND),
         MAX_TEMP = as.numeric(MAX_TEMP))

station_whistler <- read_delim("raw_data/EC/1101300.ascii", delim = ",", skip = 1) %>%
  mutate(ONE_DAY_PRECIPITATION = as.numeric(ONE_DAY_PRECIPITATION),
         ONE_DAY_RAIN = as.numeric(ONE_DAY_RAIN),
         ONE_DAY_SNOW = as.numeric(ONE_DAY_SNOW),
         MIN_TEMP = as.numeric(MIN_TEMP),
         time = as.Date(time),
         SNOW_ON_THE_GROUND = as.numeric(SNOW_ON_THE_GROUND),
         MAX_TEMP = as.numeric(MAX_TEMP))



station_whistler <- station_whistler %>%
  select(Date = time, Minimum_Temperature = MIN_TEMP, Snow_ground = SNOW_ON_THE_GROUND)


write_csv(station_whistler, path = "clean_data/snow_whistler.csv")

station_whistler %>%
  ggplot(aes(x = MIN_TEMP, y = SNOW_ON_THE_GROUND)) + geom_point()

