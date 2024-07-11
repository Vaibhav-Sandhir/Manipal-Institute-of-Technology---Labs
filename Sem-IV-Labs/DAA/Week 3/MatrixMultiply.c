#include <stdio.h>
void main()
{
    int m1, n1, m2, n2, i, j, k;

    printf("Enter matrix 1 dimensions : ");
    scanf("%d%d", &m1, &n1);

    printf("Enter matrix 2 dimensions : ");
    scanf("%d%d", &m2, &n2);

    if (n1 != m2)
        return;
    else
    {
        int a[m1][n1];
        int b[m2][n2];

        printf("Enter matrix 1 elements : ");
        for (i = 0; i < m1; i++)
            for (j = 0; j < n1; j++)
                scanf("%d", &a[i][j]);

        printf("Enter matrix 2 elements : ");
        for (i = 0; i < m2; i++)
            for (j = 0; j < n2; j++)
                scanf("%d", &b[i][j]);

        printf("Matrix 1 elements are : \n");
        for (i = 0; i < m1; i++)
        {
            for (j = 0; j < n1; j++)
                printf("%d ", a[i][j]);
            printf("\n");
        }

        printf("Matrix 2 elements are : \n");
        for (i = 0; i < m2; i++)
        {
            for (j = 0; j < n2; j++)
                printf("%d ", b[i][j]);
            printf("\n");
        }

        int c[m1][n2];

        for (i = 0; i < m1; i++)
        {
            for (j = 0; j < n2; j++)
            {
                c[i][j] = 0;
                for (k = 0; k < n1; k++)
                    c[i][j] += a[i][k] * b[k][j];
            }
        }

        printf("Result : ");
        for (i = 0; i < m1; i++)
        {
            for (j = 0; j < n2; j++)
                printf("%d ", c[i][j]);
            printf("\n");
        }
    }
}