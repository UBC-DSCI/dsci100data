# world happiness https://www.kaggle.com/unsdsn/world-happiness

library(dplyr)
library(ggplot2)
library(readr)

happy <-read.csv("raw_data/world-happiness-report/2017.csv")

head(happy)

happy %>%
  ggplot(aes(x = Economy..GDP.per.Capita., y = Happiness.Score)) + geom_point()

happy %>%
  ggplot(aes(x = Health..Life.Expectancy., y = Happiness.Score)) + geom_point()

happy %>%
  ggplot(aes(x = Freedom, y = Happiness.Score)) + geom_point()


happiness_report <- happy %>%
  select(country = Country, happiness_score = Happiness.Score, GDP_per_capita = Economy..GDP.per.Capita.,
         life_expectancy = Health..Life.Expectancy., freedom = Freedom)


write_csv(happiness_report, "clean_data/happiness_versions/happiness_report.csv")
write_tsv(happiness_report, "clean_data/happiness_versions/happiness_report.tsv")
write_delim(happiness_report, "clean_data/happiness_versions/happiness_report_semicolon.csv", delim = ";")
write_csv(happiness_report, "clean_data/happiness_versions/happiness_report_no_header.csv", col_names = FALSE)



happy_meta <- read_csv("clean_data/happiness_versions/happiness_report_metadata.csv", skip = 2)

head(happy_meta)
