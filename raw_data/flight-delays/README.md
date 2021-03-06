This dataset contains historical flight time and status info for flights departing/arriving at Boston Logan airport during the year 2015. The data was obtained from https://www.kaggle.com/usdot/flight-delays , which itself is based on publicly available U.S. Department of Transport Bureau of Transportation Statistics. The original US DOT data is available at https://transtats.bts.gov/DL_SelectFields.asp?Table_ID=236.

From the Kaggle Site:

The U.S. Department of Transportation's (DOT) Bureau of Transportation Statistics tracks the on-time performance of domestic flights operated by large air carriers. Summary information on the number of on-time, delayed, canceled, and diverted flights is published in DOT's monthly Air Travel Consumer Report and in this dataset of 2015 flight delays and cancellations.

To generate `flights_filtered.csv`, a subset of columns was selected from the full dataset (see `clean_data.py`) with rows having arrival/departure airport equal to BOS. The exact same procedure was used to generate the SQLite database `flights_filtered.db`.

The original dataset was over 500MB, and was thus too big to be stored on the dsci100data github repo.
