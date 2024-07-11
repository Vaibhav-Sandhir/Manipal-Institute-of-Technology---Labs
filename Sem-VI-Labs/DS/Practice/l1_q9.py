def main():
	nums = []
	cnt_neg = 0
	cnt_pos = 0
	print("Enter numbers of the list break by 69")
	num = int(input("Enter num : "))
	while num != 69 :
		nums.append(num)
		num = int(input("Enter num : "))
	
	for num in nums:
		if num < 0:
			cnt_neg += 1
		else:
			cnt_pos += 1
	
	print("Positive numbers : ", cnt_pos, " Negative numbers", cnt_neg)			
		

if __name__ == "__main__" :
	main()		
	
		
