def main():
	tup = (12, 7, 38, 56, 78)
	res = []
	
	for num in tup:
		if num % 2 == 0:
			res.append(num)
	
	ans = tuple(res)
	print(ans)


if __name__ == "__main__":
	main()			
