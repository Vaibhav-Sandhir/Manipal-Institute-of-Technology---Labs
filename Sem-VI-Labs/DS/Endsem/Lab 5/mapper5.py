# Mapper Reducer to find the most frequent age in heart dataset

import pandas as pd

df = pd.read_csv('heart_disease_data.csv')

ages = df['age'].values

for age in ages:
	print(str(age) + '\t' + str(1))	
