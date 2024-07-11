#include <stdio.h>
#include <cuda_runtime.h>
#include <device_launch_parameters.h>

__global__ void odd(int* arr, int n){
	int i = threadIdx.x;
	if(i % 2 != 0 && i < n - 1){
		if(arr[i] > arr[i + 1]){
			int temp = arr[i];
			arr[i] = arr[i + 1];
			arr[i + 1] = temp;
		}
	}
}

__global__ void even(int* arr, int n){
	int i = threadIdx.x;
	if(i % 2 == 0 && i < n - 1){
		if(arr[i] > arr[i + 1]){
			int temp = arr[i];
			arr[i] = arr[i + 1];
			arr[i + 1] = temp;
		}
	}
}

int main(){
	int n;
	printf("\nEnter how many elements: ");
	scanf("%d", &n);
	int size = n * sizeof(int);
	int* arr = (int*)malloc(size);
	printf("\nEnter elements of the array: ");
	for(int i = 0; i < n; i++){
		scanf("%d", &arr[i]);
	}
	int* cudaArr;
	cudaMalloc(&cudaArr, size);
	cudaMemcpy(cudaArr, arr, size, cudaMemcpyHostToDevice);
	for(int i = 0; i < n - 1; i++){
		odd <<<1, n>>> (cudaArr, n);
		even <<<1, n>>> (cudaArr, n);
	}
	cudaMemcpy(arr, cudaArr, size, cudaMemcpyDeviceToHost);
	for(int i = 0; i < n; i++){
		printf("%d ", arr[i]);
	}
	return 0;
}
