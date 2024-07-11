tup = (12, 7, 38, 56, 78)
res = []

for i in tup:
	if i % 2 == 0:
		res.append(i)

tup2 = tuple(res)
print(tup2)		
