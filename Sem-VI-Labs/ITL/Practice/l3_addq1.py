def main():
    nums = [1, 2, 3, 5, 6, 7, 9, 10 , 0, -8 ,9]
    min_ele = 1000000

    for num in nums:
        min_ele = min(min_ele, num)

    print(min_ele)


if __name__ == "__main__":
    main()
