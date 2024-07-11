# Mapper to find frequency of diff courses based on their duration

import sys
import pandas as pd

df = pd.read_excel('/home/210905152_Vaibhav/Desktop/210905152/Lab 5/GermanCredit.xlsx')

duration = df['DurationOfCreditInMonths'].values
for value in duration:
	print(str(value) + '\t' + str(1))
