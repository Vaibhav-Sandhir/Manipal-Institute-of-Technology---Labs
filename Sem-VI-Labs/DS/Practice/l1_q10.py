def main():
	nums = []
	remove = []
	print("Enter numbers of the list break by 69")
	num = int(input("Enter num : "))
	while num != 69 :
		nums.append(num)
		num = int(input("Enter num : "))
	
	for num in nums:
		if num % 2 == 0:
			remove.append(num)
	
	for num in remove:
		nums.remove(num)
	
	print(nums)		

if __name__ == "__main__" :
	main()		
	
