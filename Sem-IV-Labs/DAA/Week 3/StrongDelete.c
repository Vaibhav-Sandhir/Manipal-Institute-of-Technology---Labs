#include<stdio.h>
int fact(int n)
{
    int i,fact=1;
    for(i=1;i<=n;i++)
        fact*=i;

    return fact;
}
int isStrong(int n)
{
    int num=n,sum=0;

    while(n>0)
    {
        int dig=n%10;
        sum+=fact(dig);
        n/=10;
    }

    if(num==sum)
        return 1;
    return 0;
}
void main()
{
    int i,n;

    printf("Enter array size : ");
    scanf("%d",&n);

    int a[n];
    printf("Enter %d elements : \n",n);
    for(i=0;i<n;i++)
        scanf("%d",&a[i]);


    int count=0,j;
    for(i=0;i<n;i++)
    {
        if(isStrong(a[i]))
        {
            for(j=i;j<n;j++)
                a[j]=a[j+1];

            n--;
        }
    }

    printf("After deletion : \n");
    for(i=0;i<n;i++)
        printf("%d ",a[i]);
}