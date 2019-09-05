import numpy as np
import pandas as pd
from sqlalchemy import create_engine
import datetime

#create the SQL engine to output sqlite database
engine = create_engine('sqlite:///flights_filtered.db', echo=False)

#load raw flight data
table = pd.read_csv('flights.csv')



#take subset 
bos_flights = table[ (table['ORIGIN_AIRPORT'] == 'BOS') | (table['DESTINATION_AIRPORT'] == 'BOS')]
bos_flights = bos_flights[['YEAR', 'MONTH', 'DAY', 'DAY_OF_WEEK', 'ORIGIN_AIRPORT', 'DESTINATION_AIRPORT', 'DISTANCE', 'SCHEDULED_DEPARTURE', 'DEPARTURE_DELAY', 'SCHEDULED_ARRIVAL', 'ARRIVAL_DELAY', 'DIVERTED', 'CANCELLED']]

#remove NA rows
bos_flights = bos_flights.dropna()

#bos_fls_subset['DAY_OF_WEEK'] = bos_fls_subset['DAY_OF_WEEK'] +  (np.floor(bos_fls_subset['SCHEDULED_DEPARTURE'] / 100)*60 + (bos_fls_subset['SCHEDULED_DEPARTURE'] % 100))/(24*60)

#print head to check
print(bos_flights.head())

#output to csv; don't output row numbers
bos_flights.to_csv('flights_filtered.csv', index=False)

#output to SQLite; don't output row numbers
bos_flights.to_sql('bos_flights', con=engine, index=False)



