#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int prime_factors(int t, int arr[], int* p){
    int i;
    int j = 0;
    for(i = 2; i <= t;i++){   // + 10 so no case is left
        while(t % i == 0){
            (*p)++;
            arr[j++] = i;
            t = t / i;
        }
    }
    return j;
}

int common_factors(int factors1[],int factors2[],int count1,int count2,int *p){  //Loop should onlt run till the number of prime facors
    int i,j;
    int ans = 1;
    for(i = 0; i < count1; i++){
        for(j = 0; j < count2; j++){
            (*p)++;
            if((factors1[i] == factors2[j]) && (factors2[j] != -1)){
                ans = ans * factors1[i];
                factors2[j] = -1;
                factors1[i] = -1;
                break;                     
            }
        }
    } 
    return ans;  
}

void main(){
    int m,n;
    int* p;
    int upcount = 0;
    p = &upcount; 
    printf("\nEnter 2 elements : ");
    scanf("%d %d",&m, &n);
    int factors1[30];
    int factors2[30];
    int count1 = prime_factors(m,factors1,p);
    int count2 = prime_factors(n,factors2,p);
    int ans = common_factors(factors1, factors2,count1,count2,p);   
    printf("\nThe answer is: %d", ans);
    printf("\nUpcount is: %d",*p);
}