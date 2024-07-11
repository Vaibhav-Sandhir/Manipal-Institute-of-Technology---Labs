# Mapper Reducer to count frequency of words by reading data from terminal

import sys

for line in sys.stdin:
	line = line.strip()
	words = line.split()
	
	for word in words:
		print(word + '\t' + str(1))
