import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_csv('out2.txt', delimiter='\t', names=["Target", "Frequency"])

labels = ['Yes', 'No']
values = [df.iloc[0, 1], df.iloc[1, 1]]
plt.bar(labels, values)
plt.show()
