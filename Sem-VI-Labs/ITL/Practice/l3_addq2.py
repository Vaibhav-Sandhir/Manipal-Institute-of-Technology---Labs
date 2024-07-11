def main():
    nums = [1, 2, 6, 3, 7, 9, 10 , 0, -8 , 9]
    n = len(nums)

    for i in range(0, n - 1):
        for j in range(0, n - i - 1):
            if nums[j] > nums[j + 1]:
                nums[j], nums[j + 1] = nums[j + 1], nums[j]

    print(nums)

if __name__ == "__main__":
    main()                