# Mapper Reducer to find the most frequent age in heart dataset

import sys

max_word = None
max_count = 0
curr_word = None
curr_count = 0
word = None
count = 0

for line in sys.stdin:
	line = line.strip()
	word, count = line.split('\t', 1)
	count = int(count)
	
	if curr_word == word:
		curr_count += count
	else:
		if curr_word:
			if curr_count >= max_count:
				max_count = curr_count
				max_word = curr_word
		curr_word = word
		curr_count = count

print(max_word + '\t' + str(max_count))				

