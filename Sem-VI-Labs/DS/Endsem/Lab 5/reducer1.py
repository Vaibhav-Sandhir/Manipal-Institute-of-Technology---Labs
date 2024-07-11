# Mapper Reducer to count frequency of words by reading data from terminal

import sys

curr_word = None
curr_count = 0
word = None

for line in sys.stdin:
	line = line.strip()
	word, count = line.split('\t', 1) # 1 refers to the maximum number of splits
	count = int(count)
	
	if curr_word == word:
		curr_count += count
	else:
		if curr_word:
			print(curr_word + '\t' + str(curr_count))
		curr_count = count
		curr_word = word

if curr_word == word:
	print(curr_word + '\t' + str(curr_count))		
				
