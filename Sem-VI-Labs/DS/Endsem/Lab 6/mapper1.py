import pandas as pd

df = pd.read_csv('example.txt', delimiter='\t', names = ['Date', 'Time', 'Country', 'Item', 'Price', 'Payment'])

countries = df['Country'].values
prices = df['Price'].values

for country, price in zip(countries, prices):
	print(str(country) + '-' + str(price))
