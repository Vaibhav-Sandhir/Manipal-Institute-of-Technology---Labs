import sys

curr_word = None
curr_count = 0
word = None
count = 0

for line in sys.stdin:
	line = line.strip()
	word, count = line.split('\t', 1)
	count = int(count)
	
	if curr_word == word:
		curr_count = max(curr_count, count)
	else:
		if curr_word:
			print(str(curr_word) + "\t" + str(curr_count))
		curr_word = word
		curr_count = count

print(str(curr_word) + "\t" + str(curr_count))				
