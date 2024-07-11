class TwoSum:
    def __init__(self, nums, target):
        self.nums = nums
        self.target = target

    def find_indices(self):
        hash_map = {}

        for i, n in enumerate(self.nums):
            diff = self.target - n
            if diff in hash_map:
                return [hash_map[diff], i]
            hash_map[n] = i

def main():
    nums = [1, 2, 3, 6, 8]
    target = 9
    two_sum_instance = TwoSum(nums, target)
    print(two_sum_instance.find_indices())

if __name__ == '__main__':
    main()
