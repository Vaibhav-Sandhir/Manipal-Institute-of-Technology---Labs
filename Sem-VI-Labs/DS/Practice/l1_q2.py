def main():
	a = int(input("Enter first number : "))
	b = int(input("Enter second number : "))
	print("Before swapping a :", a, ", b : ", b)
	a, b = b, a
	print("After awapping a :", a, ", b : ", b)


if __name__ == "__main__":
	main()	
