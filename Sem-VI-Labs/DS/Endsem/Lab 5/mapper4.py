# Mapper reducer to find the most frequent word

import sys

for line in sys.stdin:
	line = line.strip()
	words = line.split()
	
	for word in words:
		print(word + '\t' + str(1))
