#include <stdio.h>
#include <stdlib.h>
#include <cuda_runtime.h>
#include <device_launch_parameters.h>

__global__ void convolve(int* arr, int* mask, int* ans, int m, int n){
	int i = threadIdx.x + (blockIdx.x * blockDim.x);
	int start = i - m / 2;
	int sum = 0;
	for(int j = 0; j < m; j++){
		int ind = start + j;
		if(ind >= 0 && ind < n){
			sum += arr[ind] * mask[j];
		}
	}
	ans[i] = sum;
	return;
}

int main(){
	int n;
	int m;
	printf("\nEnter width of the array: ");
	scanf("%d", &n);
	printf("\nEnter width of the mask(odd): ");
	scanf("%d", &m);
	int* arr = (int*)malloc(n * sizeof(int));
	int* mask = (int*)malloc(m * sizeof(int));
	int* ans = (int*)malloc(n * sizeof(int));
	printf("\nEnter elements of the array: ");
	for(int i = 0; i < n; i++){
		scanf("%d", &arr[i]);
	}
	printf("\nEnter elements of the mask: ");
	for(int i = 0; i < m; i++){
		scanf("%d", &mask[i]);
	}
	int* cudaArr;
	int* cudaMask;
	int* cudaAns;
	cudaMalloc(&cudaArr, n * sizeof(int));
	cudaMalloc(&cudaMask, m * sizeof(int));
	cudaMalloc(&cudaAns, n * sizeof(int));
	cudaMemcpy(cudaArr, arr, n * sizeof(int), cudaMemcpyHostToDevice);
	cudaMemcpy(cudaMask, arr, m * sizeof(int), cudaMemcpyHostToDevice);
	dim3 gridDim(1, 1, 1);
	dim3 blockDim(n , 1, 1);
	convolve <<<gridDim, blockDim>>> (cudaArr, cudaMask, cudaAns, m, n);
	cudaMemcpy(ans, cudaAns, n * sizeof(int), cudaMemcpyDeviceToHost);
	for(int i = 0; i < n; i++){
		printf("%d ", ans[i]);
	}
	return 0;
}
