import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_csv('out3.txt', delimiter = '\t', names = ["Status", "Count"])

labels = ["Deaths", "Recovered"]
values = [df.iloc[0, 1], df.iloc[1, 1]]
plt.bar(labels, values)
plt.show()
