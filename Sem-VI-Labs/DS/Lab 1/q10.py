list1 = [12, 7, 38, 56, 78]
remove = []
for i in list1:
	if i % 2 == 0:
		remove.append(i)
		
for i in remove:
	list1.remove(i)		

print(list1)		
