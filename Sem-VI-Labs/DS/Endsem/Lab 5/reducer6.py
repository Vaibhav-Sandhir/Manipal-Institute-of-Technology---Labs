# Mapper Reducer to add all the sale values of a specific country

import sys

total = 0
curr_word = None
curr_count = 0
word = None
count = 0.0

for line in sys.stdin:
	line = line.strip()
	word, count = line.split('\t', 1)
	count = float(count)
	
	if curr_word == word:
		curr_count += count
	else:
		if curr_word:
			print(curr_word + '\t' + str(curr_count))
		curr_word = word
		curr_count = count
	
print(curr_word + '\t' + str(curr_count))			
			
