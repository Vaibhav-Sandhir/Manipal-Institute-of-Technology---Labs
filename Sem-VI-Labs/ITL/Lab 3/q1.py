num1 = int(input('Enter first number: '))
num2 = int(input('Enter second number: '))
op = input('Enter operator: ')
ans = 0

if op == '+':
	ans = num1 + num2
elif op == '-':
	ans = num1 - num2
elif op == '*':
	ans = num1 * num2
elif op == '/':
	ans = num1 / num2

print("Ans is %d" %ans)				