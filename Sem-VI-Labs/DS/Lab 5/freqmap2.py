import sys

for line in sys.stdin:
	
	word, count = line.strip().split('\t')
	count = int(count)
	print(count, "\t" + word)
