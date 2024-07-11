import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_csv('out1.txt', delimiter='-', names = ['Country', 'Price'])

countries = df['Country'].values
prices = df['Price'].values


plt.scatter(prices, countries)
plt.xlabel('Max Price')
plt.ylabel('Countries')
plt.show()
