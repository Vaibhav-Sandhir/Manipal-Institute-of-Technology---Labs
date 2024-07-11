def main():
	a = int(input("Enter Number: "))
	factors = []

	for i in range(1, a):
		if a % i == 0:
			factors.append(i)
	print(factors)
	

if __name__ == "__main__":
	main()			
