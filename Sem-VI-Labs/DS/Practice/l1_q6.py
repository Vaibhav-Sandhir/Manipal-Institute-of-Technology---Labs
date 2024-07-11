def main():
	tup = (1, 3, 5, 7, 9, 2, 4, 6, 8, 10)
	half = len(tup) // 2
	
	for i in range(0, half):
		print(tup[i], end = " ")
	
	print("\n")
		
	for i in range(half, len(tup)):
		print(tup[i], end = " ")	
		

if __name__ == "__main__":
	main()
			
