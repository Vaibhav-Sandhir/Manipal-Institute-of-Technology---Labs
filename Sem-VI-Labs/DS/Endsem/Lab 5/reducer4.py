# Mapper reducer to find the most frequent word

import sys

max_count = 0
max_word = None
curr_word = None
curr_count = 0
word = None

for line in sys.stdin:
	line = line.strip()
	word, count = line.split('\t', 1)
	count = int(count)
	
	if curr_word == word:
		curr_count += count
	else:
		if curr_count >= max_count:
			max_count = curr_count
			max_word = curr_word
		curr_word = word
		curr_count = count

print(max_word + '\t' + str(max_count))			
