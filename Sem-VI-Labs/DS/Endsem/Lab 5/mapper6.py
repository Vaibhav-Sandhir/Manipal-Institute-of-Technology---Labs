# Mapper Reducer to add all the sale values of a specific country

import pandas as pd

df = pd.read_csv('example.txt', delimiter='\t', names=['Date', 'Time', 'Country', 'Item', 'Price', 'Method'])

countries = df['Country'].values
prices = df['Price'].values

for country, price in zip(countries, prices):
	print(str(country) + '\t' + str(price))
