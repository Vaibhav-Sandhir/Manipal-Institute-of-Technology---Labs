import numpy as np

def main():
	a = [[1,2,3],[4,5,6],[7,8,9]]
	m1 = np.array(a, dtype = "float")
	print(m1)
	b = ((1,2,3),(4,5,6))
	m2 = np.array(b)
	print(m2)
	m3 = np.zeros((3, 4))
	print(m3)
	m4 = np.arange(0, 20, 5)
	print(m4)
	m3 = m3.reshape(2, 2, 3)
	print(m3)
	
	maxi = np.max(a)
	mini = np.min(a)
	rowMax = np.max(a, axis = 0)
	rowMin = np.min(a, axis = 1)
	columnMax = np.max(a, axis = 0)
	columnMin = np.min(a, axis = 1)
	total = np.sum(a)

	print(str(total) + " " + str(maxi) + " " + str(mini) + " " + str(rowMax) + " " + str(rowMin) + " " + str(columnMax) + " " + str(columnMin))


if __name__ == "__main__":
	main()
