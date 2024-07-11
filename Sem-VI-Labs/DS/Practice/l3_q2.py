import numpy as np

m = int(input('Enter number of rows: '))
n = int(input('Enter number of columns: '))
matrix = []

for i in range(0, m):
    row = []
    for j in range(0, n):
        row.append(int(input('Enter a number : ')))
    matrix.append(row)

matrix = np.array(matrix)
row_sum = matrix.sum(axis = 1)
column_sum = matrix.sum(axis = 0)
print("Row sum is ", row_sum)
print("Column sum is ", column_sum)
