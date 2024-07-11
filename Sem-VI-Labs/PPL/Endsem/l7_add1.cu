// y = mx + b

#include <stdio.h>
#include <stdlib.h>
#include <cuda_runtime.h>
#include <device_launch_parameters.h>

__global__ void add(int* x, int* b, int* y, int m){
	int i = threadIdx.x + (blockDim.x * blockIdx.x);
	y[i] = m * x[i] + b[i];
	return;
}

int main(){
	int n;
	int m;
	printf("\nEnter number of elements of the vector: ");
	scanf("%d", &n);
	int size = n * sizeof(int);
	int* x = (int*)malloc(size);
	int* b = (int*)malloc(size);
	int* y = (int*)malloc(size);
	printf("\nEnter elements of the vector x: ");
	for(int i = 0; i < n; i++){
		scanf("%d", &x[i]);
	}
	printf("\nEnter value of slope m: ");
	scanf("%d", &m);
	printf("\nEnter value of vecotr b: ");
	for(int i = 0; i < n; i++){
		scanf("%d", &b[i]);
	}
	int* cudaX;
	int* cudaB;
	int* cudaY;
	cudaMalloc(&cudaX, size);
	cudaMalloc(&cudaB, size);
	cudaMalloc(&cudaY, size);
	cudaMemcpy(cudaX, x, size, cudaMemcpyHostToDevice);
	cudaMemcpy(cudaB, b, size, cudaMemcpyHostToDevice);
	dim3 gridDim(1, 1, 1);
	dim3 blockDim(n, 1, 1);
	add <<<gridDim, blockDim>>> (cudaX, cudaB, cudaY, m);
	cudaMemcpy(y, cudaY, size, cudaMemcpyDeviceToHost);
	for(int i = 0; i < n; i++){
		printf("%d ", y[i]);
	}
	return 0;
}
