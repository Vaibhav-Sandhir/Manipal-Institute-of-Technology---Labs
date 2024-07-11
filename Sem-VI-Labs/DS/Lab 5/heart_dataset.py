# %percentage of people who have hear disease vs don't

import matplotlib.pyplot as plt
import pandas as pd
import numpy as np

df = pd.read_csv('out_heart.txt', delimiter='\t', names=["Target", "Frequency"])
freq = df['Frequency'].values
name = list(df['Target'].values)

plt.pie(freq, labels = name, autopct='% .2f %%')
plt.savefig('heart_dataset.png')
plt.show()
