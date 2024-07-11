#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <cuda_runtime.h>
#include <device_launch_parameters.h>

__global__ void transform(char* str, char* ans, int n){
	int id = threadIdx.x;
	int size = n - id;
	int ind = ((n - size) * (size + 1 + n)) / 2;
	for(int i = 0; i < size; i++){
		ans[ind + i] = str[i];
	}
	return;
}

int main(){
	char* str = (char*)malloc(1024 * sizeof(char));
	printf("\nEnter string: ");
	scanf("%s", str);
	int n = strlen(str);
	str[n] = '\0';
	int m = (n * (n + 1)) / 2;
	char* ans = (char*)malloc(m * sizeof(char));
	char* cudaStr;
	char* cudaAns;
	cudaMalloc(&cudaStr, n * sizeof(char));
	cudaMalloc(&cudaAns, m * sizeof(char));
	cudaMemcpy(cudaStr, str, n * sizeof(char), cudaMemcpyHostToDevice);
	transform<<<1, n>>> (cudaStr, cudaAns, n);
	cudaMemcpy(ans, cudaAns, m * sizeof(char), cudaMemcpyDeviceToHost);
	printf("\n%s", ans);
	return 0;
}
