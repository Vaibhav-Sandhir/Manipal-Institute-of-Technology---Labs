# Mapper to find how many people have heart disease vs don't

import sys

for line in sys.stdin:
	line = line.strip()
	words = line.split(',')
	if(words[13] == "Yes" or words[13] == "No"):
		print(words[13] + '\t' + str(1))
