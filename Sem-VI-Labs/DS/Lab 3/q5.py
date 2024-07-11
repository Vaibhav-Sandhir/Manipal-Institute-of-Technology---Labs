import numpy as np

def main():
	m1 = np.array([(3, 2, 9), (1, 6, 7), (5, 8, 9)])
	m2 = np.array([(3, 2, 9), (1, 6, 7), (5, 8, 9)])
	m3 = m1 + m2
	print(m3)


if __name__ == "__main__":
	main()
