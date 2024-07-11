#include <stdio.h>
#include <stdlib.h>
#include <cuda_runtime.h>
#include <device_launch_parameters.h>

__global__ void sort(int* arr, int* ans, int n){
	int id = threadIdx.x + (blockDim.x * blockIdx.x);
	int num = arr[id];
	int pos = 0;
	for(int i = 0; i < n; i++){
		if(num < arr[i] || (num == arr[i] && i < id)){
			pos++;
		}
	}
	ans[pos] = num;
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
	int* cudaAns;
	cudaMalloc(&cudaArr, size);
	cudaMalloc(&cudaAns, size);
	cudaMemcpy(cudaArr, arr, size, cudaMemcpyHostToDevice);
	dim3 dimGrid(1, 1, 1);
	dim3 dimBlock(n, 1, 1);
	sort <<<dimGrid, dimBlock>>> (cudaArr, cudaAns, n);
	cudaMemcpy(arr, cudaAns, size, cudaMemcpyDeviceToHost);
	for(int i = 0; i < n; i++){
		printf("%d ", arr[i]);
	}
	return 0;
}
