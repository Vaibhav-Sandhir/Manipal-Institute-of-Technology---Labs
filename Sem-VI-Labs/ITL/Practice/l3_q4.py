def main():
    words = ["my", "hello", "name", "nak"]

    for i in range(0, len(words)):
        min_index = i
        for j in range(i, len(words) - 1):
            if words[j] < words[j + 1]:
                min_index = j
        words[i], words[min_index] = words[min_index], words[i]

    print(words)            


if __name__ == "__main__":
    main()