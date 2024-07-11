# Mapper to read example.txt will count frequency of cuntries

import sys

for line in sys.stdin:
	line = line.strip()
	words = line.split('\t')
	print(words[2] + '\t' + str(1))
