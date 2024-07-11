#include <cuda_runtime.h>
#include <device_launch_parameters.h>
#include <stdio.h>

__global__ void addVectors(int* a, int* b, int* c){
	int i = threadIdx.x;
	c[i] = a[i] + b[i];
	return;
}

int main(){
	int n;
	printf("\nEnter length of the vectors : ");
	scanf("%d", &n);
	
	int* a = (int*)malloc(sizeof(int) * n);
	int* b = (int*)malloc(sizeof(int) * n);
	int* c = (int*)malloc(sizeof(int) * n);
	
	printf("\nEnter values for the 1st vector: ");
	for(int i = 0; i < n; i++){
		scanf("%d", &a[i]);
	}
	printf("\nEnter values for the 2nd vector: ");
	for(int i = 0; i < n; i++){
		scanf("%d", &b[i]);
	}
	
	int* cudaA;
	int* cudaB;
	int* cudaC;
	
	cudaMalloc(&cudaA, sizeof(int) * n);
	cudaMalloc(&cudaB, sizeof(int) * n);
	cudaMalloc(&cudaC, sizeof(int) * n);
	
	cudaMemcpy(cudaA, a, sizeof(int) * n, cudaMemcpyHostToDevice);
	cudaMemcpy(cudaB, b, sizeof(int) * n, cudaMemcpyHostToDevice);
	
	addVectors<<<1, n>>> (cudaA, cudaB, cudaC);
	
	cudaMemcpy(c, cudaC, sizeof(int) * n, cudaMemcpyDeviceToHost);
	
	for(int i = 0; i < n; i++){
		printf("%d ", c[i]);
	}  
	
	return 0;
}
