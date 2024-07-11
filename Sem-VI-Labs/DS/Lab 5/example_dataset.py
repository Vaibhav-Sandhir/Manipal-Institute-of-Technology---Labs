# Displaying only those countries with freq > 1
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

df = pd.read_csv('out_example.txt', delimiter = '\t', names=['Country', 'Frequency'])

df = df[df['Frequency'] > 1]


countries = list(df['Country'].values)
freq = df['Frequency'].values

plt.pie(freq, labels=countries, autopct='% .2f %%')
plt.savefig('example_dataset.png')
plt.show()


