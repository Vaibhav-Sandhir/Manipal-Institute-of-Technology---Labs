class Solution:
    def __init__(self, s):
        self.s = s

    def reverseWords(self):
        s = self.s.strip()
        words = s.split()
        ans = ""
        for word in words[::-1]:
            ans = ans + word + ' '
        ans = ans.strip()    
        return ans;


def main():
    solution = Solution("the sky is blue")
    print(solution.reverseWords())


if __name__ == "__main__":
    main()
        