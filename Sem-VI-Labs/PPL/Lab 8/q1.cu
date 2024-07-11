#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <cuda_runtime.h>
#include <device_launch_parameters.h>

__global__ void countWord(char* str, char* target, int* pos, int* count, int m){
	int id = threadIdx.x;
	int ind = 2 * id;
	int start = pos[ind];
	int end = pos[ind + 1];
	if(end - start + 1 != m){
		return;
	}
	for(int i = start, j = 0; i <= end; i++, j++){
		if(str[i] != target[j]){
			return;
		}
	}
	atomicAdd(count, 1);
	return;
}

int main(){
	char* str = (char*)malloc(1024 * sizeof(char));
	char* target = (char*)malloc(1024 * sizeof(char));
	int* count = 0;
	int* pos = (int*)malloc(1024 * sizeof(int));
	printf("\nEnter string: ");
	fgets(str, 1024, stdin);
	printf("\nEnter word to be searched: ");
	fgets(target, 1024, stdin);
	int n = strlen(str);
	int m = strlen(target);
	str[n] = '\0';
	target[m] = '\0';
	pos[0] = 0;
	int j = 1;
	for(int i = 0; i < n; i++){
		if(str[i] == ' '){
			pos[j++] = i - 1;
			pos[j++] = i + 1;
		}
	}
	pos[j++] = n - 1;
	pos[j] = '\0';
	int threads = j / 2;
	char* cudaStr;
	char* cudaTarget;
	int* cudaPos;
	int* cudaCount = 0;
	int* result = (int*)malloc(sizeof(int));
	cudaMalloc(&cudaStr, n * sizeof(char));
	cudaMalloc(&cudaTarget, m * sizeof(char));
	cudaMalloc(&cudaPos, j * sizeof(int));
	cudaMalloc(&cudaCount, sizeof(int));
	cudaMemcpy(cudaStr, str, n * sizeof(char), cudaMemcpyHostToDevice);
	cudaMemcpy(cudaTarget, target, strlen(target) * sizeof(char), cudaMemcpyHostToDevice);
	cudaMemcpy(cudaPos, pos, j * sizeof(int), cudaMemcpyHostToDevice);
	cudaMemcpy(cudaCount, count, sizeof(int), cudaMemcpyHostToDevice);
	countWord<<<1, threads>>> (cudaStr, cudaTarget, cudaPos, cudaCount, m - 1);
	cudaMemcpy(result, cudaCount, sizeof(int), cudaMemcpyDeviceToHost);
	printf("\n%s occured %d times", target, *result);
	return 0; 	
}
