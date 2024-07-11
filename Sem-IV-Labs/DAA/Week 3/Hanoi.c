#include<stdio.h>
void towerOfHanoi(int n,char source,char dest,char aux)
{
    if(n==1)
    {
        printf("\nMove disk 1 from %c to %c",source,dest);
        return ;
    }
    towerOfHanoi(n-1,source,aux,dest);
    printf("\nMove disk %d from %c to %c",n,source,dest);
    towerOfHanoi(n-1,aux,source,dest);
}
void main()
{
    int n;
    printf("Enter number of discs : ");
    scanf("%d",&n);

    towerOfHanoi(n,'S','D','A');
}