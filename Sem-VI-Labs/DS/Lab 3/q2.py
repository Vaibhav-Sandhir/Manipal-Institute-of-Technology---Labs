import numpy as np

def main():
	a = np.array([(3, 2, 9), (1, 6, 7), (5, 8, 9)])
	rowSum = np.sum(a, axis = 0)
	columnSum = np.sum(a, axis = 1)
	print("Row sum is : " + str(rowSum) + "\nColumn sum is : " + str(columnSum))


if __name__ == "__main__":
	main()
