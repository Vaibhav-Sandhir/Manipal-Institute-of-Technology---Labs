#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int main()
{
    char str[100];
    char substr[100];
    int i;
    int j;
    int flag = 0;
    printf("\nEnter String: ");
    gets(str);
    printf("\n");
    printf("\nEnter Substring: ");
    gets(substr);
    int n = strlen(str);
    int m = strlen(substr);
    for (i = 0; i <= n - m; i++)
    {
        j = 0;
        while (j < m && str[i + j] == substr[j])
        {
            j = j + 1;
        }
        if (j == m)
        {
            flag = 1;
            break;
        }
    }
    if (flag)
    {
        printf("\nFound");
    }
    else
    {
        printf("Not Found");
    }
}