def main():
	nums = []
	print("Enter numbers of the list break by 69")
	num = int(input("Enter num : "))
	while num != 69 :
		nums.append(num)
		num = int(input("Enter num : "))
	
	for num in nums:
		if num < 0:
			print(num)
		

if __name__ == "__main__" :
	main()		
	
		
