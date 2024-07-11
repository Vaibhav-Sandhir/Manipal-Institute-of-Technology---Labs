class Solution:
    def __init__(self):
        self.input_string = ""

    def get_String(self):
        self.input_string = input("Enter a string: ")

    def print_String(self):
        print("String in uppercase:", self.input_string.upper())

def main():
    obj = Solution()

    obj.get_String()

    obj.print_String()

if __name__ == "__main__":
    main()
