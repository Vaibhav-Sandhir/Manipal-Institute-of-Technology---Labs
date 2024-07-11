import pandas as pd

df = pd.read_csv('covid_19_data.csv')

countries = df['Country/Region'].values
cases = df['Confirmed'].values

for country, case in zip(countries, cases):
	print(str(country) + "\t" + str(case))
