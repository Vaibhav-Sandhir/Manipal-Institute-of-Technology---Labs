#include <stdio.h>
#include <stdlib.h>
#include <cuda_runtime.h>
#include <device_launch_parameters.h>

__global__ void sinOf(float* arr, float* ans){
	int i = threadIdx.x + (blockIdx.x * blockDim.x);
	ans[i] = sinf(arr[i]);
	return;
}

int main(){
	int n;
	printf("\nEnter how many elements: ");
	scanf("%d", &n);
	int size = n * sizeof(float);
	float* arr = (float*)malloc(size);
	float* ans = (float*)malloc(size);
	printf("\nEnter angles in radians: ");
	for(int i = 0; i < n; i++){
		scanf("%f", &arr[i]);
	}
	float* cudaArr;
	float* cudaAns;
	cudaMalloc(&cudaArr, size);
	cudaMalloc(&cudaAns, size);
	cudaMemcpy(cudaArr, arr, size, cudaMemcpyHostToDevice);
	dim3 gridDim(1, 1, 1);
	dim3 blockDim(n, 1, 1);
	sinOf <<<gridDim, blockDim>>> (cudaArr, cudaAns);
	cudaMemcpy(ans, cudaAns, size, cudaMemcpyDeviceToHost);
	for(int i = 0; i < n; i++){
		printf("%f ", ans[i]);
	}
	return 0;
}
