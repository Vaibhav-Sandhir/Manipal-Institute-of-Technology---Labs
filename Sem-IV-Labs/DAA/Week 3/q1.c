#include <stdio.h>

void swap(int *x, int *y)
{
    int temp = *x;
    *x = *y;
    *y = temp;
}

int bubble_sort(int array[], int n)
{
    int i;
    int j;
    int upcount = 0;
    int flag = 0;
    for (i = 0; i < n - 1; i++)
    {
        for (j = 0; j < n - 1 - i; j++)
        {
            upcount++;
            if (array[j] > array[j + 1])
            {
                flag = 1;
                swap(&array[j], &array[j + 1]);
            }
        }
        if (flag == 0)
            break;
    }
    return upcount;
}

void main()
{
    int n;
    int i;
    int item;
    printf("\nEnter number of elements in the array: ");
    scanf("%d", &n);
    int array[n];
    printf("\nEnter array elements: ");
    for (i = 0; i < n; i++)
    {
        scanf("%d", &item);
        array[i] = item;
    }
    printf("\nUpcount: %d", bubble_sort(array, n));
    for (i = 0; i < n; i++)
    {
        printf("  %d", array[i]);
    }
}