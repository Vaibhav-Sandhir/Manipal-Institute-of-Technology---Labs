#include <cuda_runtime.h>
#include <device_launch_parameters.h>
#include <stdio.h>
#include <math.h>

__global__ void addVectors(int* a, int* b, int* c){
	int i = threadIdx.x + (blockIdx.x * blockDim.x);
	c[i] = a[i] + b[i];
	return;
}

int main(){
	int n;
	printf("\nEnter array length bigger than 2 : ");
	scanf("%d", &n);
	int size = sizeof(int) * n;
	
	int* a = (int*)malloc(size);
	int* b = (int*)malloc(size);
	int* c = (int*)malloc(size);
	
	printf("\nEnter elements of the 1st vector: ");
	for(int i = 0; i < n; i++){
		scanf("%d", &a[i]);
	}
	printf("\nEnter elements of the 2nd vector: ");
	for(int i = 0; i < n; i++){
		scanf("%d", &b[i]);
	}
	
	int* cudaA;
	int* cudaB;
	int* cudaC;
	
	cudaMalloc(&cudaA, size);
	cudaMalloc(&cudaB, size);
	cudaMalloc(&cudaC, size);
	
	cudaMemcpy(cudaA, a, size, cudaMemcpyHostToDevice);
	cudaMemcpy(cudaB, b, size, cudaMemcpyHostToDevice);
	
	int block_size = ceil(n / 2.0);
	addVectors<<<block_size, 2>>> (cudaA, cudaB, cudaC);
	
	cudaMemcpy(c, cudaC, size, cudaMemcpyDeviceToHost);
	
	for(int i = 0; i < n; i++){
		printf("%d ", c[i]);
	}
	
	return 0;
}
