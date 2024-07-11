class StringHandler:

    def getString(self):
        self.word = input('Enter a String: ')

    def printString(self):
        print(self.word.upper())


def main():
    obj = StringHandler()
    obj.getString()
    obj.printString()


if __name__ == "__main__":
    main()