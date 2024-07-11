def main():
    file1 = input('Enter file name: ')
    f1 = open(file1, "r")
    f2 = open("output.txt", "w")

    data = f1.read()
    rev_data = data[::-1]
    f2.write(rev_data)
    
    f1.close()
    f2.close()

if __name__ == "__main__":
    main()
