import sys

ans = []
maxFreq = -1

for line in sys.stdin:
	count, word = line.strip().split('\t')
	count = int(count)
	if count > maxFreq:
		maxFreq = count
		ans = [word]
	elif count == maxFreq:
		ans.append(word)

for word in ans:
	print(word + '\t' + str(maxFreq))		
