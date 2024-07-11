# Mapper Reducer to count how many patients have heart diease

import pandas as pd

df = pd.read_csv('/home/vaibhav/Desktop/SEM-VI-Labs/DS/Endsem/Lab 5/heart_disease_data.csv')
words = df['target'].values

for word in words:
	print(word + '\t' + str(1))
