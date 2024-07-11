
def main():
	arr = [1, 2, 3, 4, 5, 6, 7, 8]
	target = 1

	def binarySearch(l, r):
		if l > r:
			return -1
		mid = (l + r) // 2
		if arr[mid] == target:
			return mid
		elif arr[mid] > target:
			return binarySearch(l, mid - 1)
		else:
			return binarySearch(mid + 1, r)


	print(binarySearch(0, len(arr) - 1))


if __name__ == "__main__":
	main()
