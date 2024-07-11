#include <stdio.h>
#include <stdlib.h>
#include <cuda_runtime.h>
#include <device_launch_parameters.h>

__global__ void add(int* arr1, int* arr2, int* arr3){
	int i = threadIdx.x;
	arr3[i] = arr1[i] + arr2[i];
	return;
}

int main(){
	int n;
	printf("\nEnter how many elemenst are there in the vector: ");
	scanf("%d", &n);
	int size = n * sizeof(int);
	int* arr1 = (int*)malloc(size);
	int* arr2 = (int*)malloc(size);
	int* arr3 = (int*)malloc(size);
	printf("\nEnter elements of the first vector: ");
	for(int i = 0; i < n; i++){
		scanf("%d", &arr1[i]);
	}
	printf("\nEnter elements of the second vector: ");
	for(int i = 0; i < n; i++){
		scanf("%d", &arr2[i]);
	}
	int* cudaArr1;
	int* cudaArr2;
	int* cudaArr3;
	cudaMalloc(&cudaArr1, size);
	cudaMalloc(&cudaArr2, size);
	cudaMalloc(&cudaArr3, size);
	cudaMemcpy(cudaArr1, arr1, size, cudaMemcpyHostToDevice);
	cudaMemcpy(cudaArr2, arr2, size, cudaMemcpyHostToDevice);
	dim3 gridDim(1, 1, 1);
	dim3 blockDim(n, 1, 1);
	add <<<gridDim, blockDim>>>(cudaArr1, cudaArr2, cudaArr3);
	cudaMemcpy(arr3, cudaArr3, size, cudaMemcpyDeviceToHost);
	for(int i = 0; i < n; i++){
		printf("%d ", arr3[i]);
	}
	return 0;
}
