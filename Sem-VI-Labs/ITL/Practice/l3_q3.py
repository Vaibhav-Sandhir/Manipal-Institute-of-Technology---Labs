def main():
    arr = [1,2,3,4,5,6]
    target = 6

    def binarySearch(left, right):
        if left > right:
            return -1
        mid = (left + right) // 2
        if arr[mid] == target:
            return mid
        elif arr[mid] > target:
            return binarySearch(left, mid - 1)
        else:
            return binarySearch(mid + 1, right)

    ans = binarySearch(0, len(arr) - 1)
    print(ans)


if __name__ == "__main__":
    main()