def main():
	file1 = open("input.txt", "r")
	file2 = open("output.txt", "w")
	data1 = file1.read()
	data2 = data1[::-1]
	file2.write(data2)
	file1.close()
	file2.close()


if __name__ == "__main__":
	main()	