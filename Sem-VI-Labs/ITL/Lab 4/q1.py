class SubsetFinder:
    def __init__(self, nums):
        self.nums = nums
        self.result = []
        self.subset = []

    def find_subsets(self):
        self.dfs(0, self.nums, self.subset, self.result)
        return self.result

    def dfs(self, i, nums, subset, result):
        if i >= len(nums):
            result.append(subset.copy())
            return
            
        subset.append(nums[i])
        self.dfs(i + 1, nums, subset, result)
        subset.pop()
        self.dfs(i + 1, nums, subset, result)

def main():
    nums = [1, 2, 3]
    subset_finder = SubsetFinder(nums)
    subsets = subset_finder.find_subsets()
    print(subsets)

if __name__ == '__main__':
    main()
