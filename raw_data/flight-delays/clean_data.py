import pandas as pd

table = pd.read_csv('flights.csv')

bos_departures = table[ table['ORIGIN_AIRPORT'] == 'BOS' ]
bos_deps_subset = bos_departures[['YEAR', 'MONTH', 'DAY', 'DAY_OF_WEEK', 'DESTINATION_AIRPORT', 'DISTANCE', 'SCHEDULED_DEPARTURE', 'DEPARTURE_DELAY', 'SCHEDULED_ARRIVAL', 'ARRIVAL_DELAY', 'DIVERTED', 'CANCELLED']]

print(bos_deps_subset.head())

bos_deps_subset.to_csv('flights_filtered.csv', index=False)



