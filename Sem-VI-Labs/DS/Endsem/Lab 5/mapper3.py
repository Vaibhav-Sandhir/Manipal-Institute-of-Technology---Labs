# Mapper Reducer for covid 19 dataset

import pandas as pd

df = pd.read_csv('/home/vaibhav/Desktop/SEM-VI-Labs/DS/Endsem/Lab 5/covid_19_data.csv')

deaths = df['Deaths'].values
recovered = df['Recovered'].values

for i in deaths:
	print('Deaths' + '\t' + str(i))
for i in recovered:
	print('Recovered' + '\t' + str(i))

	
	
