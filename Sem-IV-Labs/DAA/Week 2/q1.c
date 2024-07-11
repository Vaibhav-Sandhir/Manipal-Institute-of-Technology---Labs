#include <stdio.h>
#include <stdlib.h>

int min(int m, int n){
    if(m > n)
        return n;
    else
        return m;    
}

int gcd(int m, int n,int *p){
    int t = min(m,n);
    for(; t >=1; t-- ){
        (*p)++;
        if( m % t == 0 && n %t == 0){
            return t;
        }
    }        
}

void main(){
    int m,n;
    int upcount = 0;
    int *p = &upcount;
    printf("\nEnter 2 elements : ");
    scanf("%d %d",&m, &n);
    int ans = gcd(m, n,p);
    printf("\nThe Greatest Common Divider is %d",ans);
    printf("\nUpcount is: %d",*p);
}