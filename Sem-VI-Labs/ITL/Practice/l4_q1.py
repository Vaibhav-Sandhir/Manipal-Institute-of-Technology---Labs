class Subsets:

    def __init__(self, nums):
        self.nums = nums

    def getSubsets(self):
        result = []
        subset = []

        def dfs(i):
            if i == len(self.nums):
                result.append(subset.copy())
                return

            subset.append(self.nums[i])
            dfs(i + 1)
            subset.pop()
            dfs(i + 1)

        dfs(0)
        return result


def main():
    nums = [1,2,3]
    subsets = Subsets(nums)
    result = subsets.getSubsets()
    print(result)


if __name__ == "__main__":
    main()