list1 = [11, -21, 0, 45, 66, -93]
positiveCount = 0
negativeCount = 0

for i in list1:
	if i < 0:
		negativeCount += 1
	else:
		positiveCount += 1

print('Positive Numbers : ' + str(positiveCount) + '\n' + 'Negative Numbers : ' + str(negativeCount))			
