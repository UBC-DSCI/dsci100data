import pandas as pd
from sqlalchemy import create_engine

#create the SQL engine to output sqlite database
engine = create_engine('sqlite://', echo=False)

#load raw flight data
table = pd.read_csv('flights.csv')

#take subset 
bos_flights = table[ (table['ORIGIN_AIRPORT'] == 'BOS') | (table['DESTINATION_AIRPORT'] == 'BOS')]
bos_fls_subset = bos_flights[['YEAR', 'MONTH', 'DAY', 'DAY_OF_WEEK', 'ORIGIN_AIRPORT', 'DESTINATION_AIRPORT', 'DISTANCE', 'SCHEDULED_DEPARTURE', 'DEPARTURE_DELAY', 'SCHEDULED_ARRIVAL', 'ARRIVAL_DELAY', 'DIVERTED', 'CANCELLED']]

#print head to check
print(bos_fls_subset.head())

#output to csv; don't output row numbers
bos_fls_subset.to_csv('flights_filtered.csv', index=False)

#output to SQLite; don't output row numbers
bos_fls_subset.to_sql('flights_filtered.sqlite', con=engine, index=False)



