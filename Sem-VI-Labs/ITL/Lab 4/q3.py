class Solution:
    def helper(self, x, n):
        if n == 0:
            return 1
        if n == 1:
            return x

        ans = self.helper(x, n // 2)
        ans = ans * ans
        return ans if n % 2 == 0 else ans * x

    def power(self):
        x = float(input('Enter base: '))
        n = float(input('Enter exponent: '))
        res = self.helper(x, abs(n))
        ans = res if n >= 0 else 1 / res
        print(str(ans))

def main():
    obj = Solution()
    obj.power()

if __name__ == '__main__':
    main()
