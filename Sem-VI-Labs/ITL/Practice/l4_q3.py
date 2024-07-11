class Pow:

    def pow(self, x, n):
        if n == 0:
            return 1
        if n == 1:
            return x

        half = n // 2
        num = pow(x, half)**2
        if n % 2 != 0:
            num = x * num
        return num


def main():
    obj = Pow()
    ans = obj.pow(3, 4)
    print(ans)

if __name__ == "__main__":
    main()    