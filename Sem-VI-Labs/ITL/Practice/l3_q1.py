def main():
    num1 = int(input('Enter first number: '))
    num2 = int(input('Enter second number: '))
    operator = input('Enter operator')
    ans = 0
    
    if operator not in ["+", "-", "/", "*"]:
        print("Enter a valid operator: ")
        return
    
    if operator == "+":
        ans = num1 + num2
    elif operator == "-":
        ans = num1 - num2
    elif operator == "/":
        ans = num1 / num2
    elif operator == "*":
        ans = num1 * num2
    else:
        print("Enter a valid operator")
        return

    print("Ans is ", ans)


if __name__ == "__main__":
    main()
