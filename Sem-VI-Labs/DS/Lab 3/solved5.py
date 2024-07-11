import numpy as np

A1=np.array([(3,4,5),(12,6,1)])
A2=np.array([(1,2,6),(-4,3,8)])
D1=np.vstack((A1,A2))
D2=np.hstack((A1,A2))
print(D1)
print(D2)
a = np.array([4.,2.])
b = np.array([3.,8.])
print(np.column_stack((a,b)))
print(np.hstack((a,b)))
a=np.array([(3,2,9),(1,6,7)])
s=0
for i in range(a.shape[0]):
	for j in range(a.shape[1]):
		s+=a[i,j]
print(s)