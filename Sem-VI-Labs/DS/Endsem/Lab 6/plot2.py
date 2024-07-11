import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_csv('out2.txt', delimiter = '\t', names = ['Country', 'Cases'])

country = df['Country'].values
cases = df['Cases'].values
country = country[:10]
cases = cases[:10]

plt.scatter(cases, country)
plt.xlabel('Max Cases')
plt.ylabel('Country')
plt.show()

