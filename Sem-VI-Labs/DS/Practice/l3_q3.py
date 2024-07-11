import numpy as np
# a.)
arr = np.array([1,2,3,4], dtype = float)
print(arr)
print("---------------------------")

# b.)
arr = np.array((1,2,3,4))
print(arr)
print("---------------------------")

# c.)
arr = np.zeros((3,4))
print(arr)
print("---------------------------")

# d.)
arr = np.arange(0, 21, 5)
print(arr)
print("---------------------------")

# e.)
arr = np.ones((3,4))
arr = arr.reshape((2,2,3))
print(arr)
print("---------------------------")

# f.)
arr = np.array([[1,2,3],[4,5,6],[7,8,9]]) 
row_max = arr.max(axis = 1)
row_min = arr.min(axis = 1)
column_max = arr.max(axis = 0)
column_min = arr.min(axis = 0)
row_sum = arr.sum(axis = 1)
column_sum = arr.sum(axis = 0)
print(row_sum)