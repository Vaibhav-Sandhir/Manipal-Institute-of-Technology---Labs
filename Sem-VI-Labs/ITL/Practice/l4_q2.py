class TwoSum:

    def __init__(self, nums, target):
        self.nums = nums
        self.target = target

    def twoSum(self):
        hash_map = {}

        for i, num in enumerate(self.nums):
            diff = self.target - num
            if diff in hash_map:
                return [i, hash_map[diff]]
            hash_map[num] = i

        return [-1,-1]


def main():
    nums = [10, 20, 10, 40, 50, 60, 70]
    target = 50
    obj = TwoSum(nums, target)
    ans = obj.twoSum()
    print(ans)


if __name__ == "__main__":
    main()