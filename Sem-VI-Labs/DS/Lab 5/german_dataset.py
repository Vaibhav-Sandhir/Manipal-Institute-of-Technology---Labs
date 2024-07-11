import matplotlib.pyplot as plt
import numpy as np
import pandas as pd

df = pd.read_csv('out_german.txt', delimiter='\t', names=['Duration', 'Frequency']);

freq = df['Frequency'].values
time = list(df['Duration'].values)

explode = tuple([0.1] * len(time))

plt.pie(freq, labels=time, explode=explode)
plt.tight_layout()
plt.savefig('german_dataset.png')
plt.show()
