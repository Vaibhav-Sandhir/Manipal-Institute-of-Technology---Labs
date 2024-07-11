class Solution:
    def __init__(self, s):
        self.s = s

    def isValid(self):
        hashMap = {")":"(", "}":"{", "]":"["}
        stack = []
        
        for bracket in self.s:
            if bracket in ["(", "{", "["]:
                stack.append(bracket)
            else:
                if len(stack) == 0:
                    return False
                top = stack.pop()
                if top != hashMap[bracket]:
                    return False
        return len(stack) == 0


def main():
    solution = Solution("(()[]{})")
    print(solution.isValid())

if __name__ == "__main__":
    main()