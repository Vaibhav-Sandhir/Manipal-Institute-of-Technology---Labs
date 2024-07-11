a = int(input('Enter first number: '))
b = int(input('Enter second number: '))
c = int(input('Enter third number: '))
ans = 0;

if a >= b and a >= c:
	ans = a
elif b >= a and b >= c:
	ans = b
else:
	ans = c		

print(ans)
