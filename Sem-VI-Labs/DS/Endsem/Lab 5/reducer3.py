# Mapper Reducer for covid 19 dataset

import sys

curr_word = None
cur_count = 0
word = None

for line in sys.stdin:
	line = line.strip()
	word, count = line.split('\t', 1)
	count = int(count)
	
	if curr_word == word:
		curr_count += count
	else:
		if curr_word:
			print(curr_word + '\t' + str(curr_count))
		curr_word = word
		curr_count = count
	
print(curr_word + '\t' + str(curr_count))	
					
