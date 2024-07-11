#include <stdio.h>
#include <stdlib.h>
#include <cuda_runtime.h>
#include <device_launch_parameters.h>

__global__ void multiply(int alpha, int* x, int* y, int* ans, int n){
	int i = threadIdx.x + (blockDim.x * blockIdx.x);
	if(n < 32){
		ans[i] = (alpha * x[i]) + y[i];
	}
	return;	
}

int main(){
	int n;
	printf("\nEnter vector length: ");
	scanf("%d", &n);
	int size = n * sizeof(n);
	int* x = (int*)malloc(size);
	int* y = (int*)malloc(size);
	int* ans = (int*)malloc(size);
	int alpha;
	printf("\nEnter values of x: ");
	for(int i = 0; i < n; i++){
		scanf("%d", &x[i]);
	}
	printf("\nEnter values of y: ");
	for(int i = 0; i < n; i++){
		scanf("%d", &y[i]);
	}
	printf("\nEnter constant value: ");
	scanf("%d", &alpha);
	int* cudaX;
	int* cudaY;
	int* cudaAns;
	cudaMalloc(&cudaX, size);
	cudaMalloc(&cudaY, size);
	cudaMalloc(&cudaAns, size);
	cudaMemcpy(cudaX, x, size, cudaMemcpyHostToDevice);
	cudaMemcpy(cudaY, y, size, cudaMemcpyHostToDevice);
	dim3 dimGrid(1, 1, 1);
	dim3 dimBlock(n, 1, 1);
	multiply <<<dimGrid, dimBlock>>> (alpha, cudaX, cudaY, cudaAns, n);
	cudaMemcpy(ans, cudaAns, size, cudaMemcpyDeviceToHost);
	printf("\nAns is : ");
	for(int i = 0; i < n; i++){
		printf("%d ", ans[i]);
	}
	return 0;
}
