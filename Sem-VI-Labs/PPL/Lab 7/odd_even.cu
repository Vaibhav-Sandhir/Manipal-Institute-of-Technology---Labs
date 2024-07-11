#include <stdio.h>
#include <stdlib.h>
#include <cuda_runtime.h>
#include <device_launch_parameters.h>

__global__ void even(int* arr, int n){
	int id = threadIdx.x;
	if(id % 2 == 0 && id < n - 1){
		if(arr[id] >= arr[id + 1]){
			int temp = arr[id];
			arr[id] = arr[id + 1];
			arr[id + 1] = temp;
		}
	}
	return;
}

__global__ void odd(int* arr, int n){
	int id = threadIdx.x;
	if(id % 2 == 1 && id < n - 1){
		if(arr[id] >= arr[id + 1]){
			int temp = arr[id];
			arr[id] = arr[id + 1];
			arr[id + 1] = temp;
		}
	}
	return;
}

int main(){
	int n;
	printf("\nEnter size of vector: ");
	scanf("%d", &n);
	int size = n * sizeof(int);
	int* arr = (int*)malloc(size);
	printf("\nEnter elements of the vector: ");
	for(int i = 0; i < n; i++){
		scanf("%d", &arr[i]);
	}
	int* cudaArr;
	cudaMalloc(&cudaArr, size);
	cudaMemcpy(cudaArr, arr, size, cudaMemcpyHostToDevice);
	dim3 dimGrid(1, 1, 1);
	dim3 dimBlock(n, 1, 1);
	for(int i = 0; i <= n / 2; i++){
		even <<<dimGrid, dimBlock>>> (cudaArr, n);
		odd <<<dimGrid, dimBlock>>> (cudaArr, n);
	}
	cudaMemcpy(arr, cudaArr, size, cudaMemcpyDeviceToHost);
	for(int i = 0; i < n; i++){
		printf("%d ", arr[i]);
	}
	return 0;
}
