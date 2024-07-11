def main():
	words = ["my", "hello", "name", "nak"]
	n = len(words)
	for i in range(1, n):
		key = words[i]
		j = i - 1
		while j >= 0 and words[j] > key:
			words[j + 1] = words[j]
			j -= 1
		words[j + 1] = key	
	print(words)	

if __name__ == "__main__":
	main()
