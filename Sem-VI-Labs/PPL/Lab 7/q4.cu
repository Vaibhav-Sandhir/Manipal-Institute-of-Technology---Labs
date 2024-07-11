#include <cuda_runtime.h>
#include <device_launch_parameters.h>
#include <stdio.h>

__global__ void sinOf(double* a, double* b){
	int i = threadIdx.x + (blockIdx.x * blockDim.x);
	b[i] = sinf(a[i]);
}

int main(){
	int n;
	printf("\nEnter length of 1D array: ");
	scanf("%d", &n);
	int size = sizeof(double) * n;
	
	double* a = (double*)malloc(size);
	double* b = (double*)malloc(size);
	
	printf("\nEnter angles in radians: ");
	for(int i = 0; i < n; i++){
		scanf("%lf", &a[i]);
	}
	
	double* cudaA;
	double* cudaB;
	
	cudaMalloc(&cudaA, size);
	cudaMalloc(&cudaB, size);
	
	cudaMemcpy(cudaA, a, size, cudaMemcpyHostToDevice);
	
	sinOf<<<1, n>>>(cudaA, cudaB);
	
	cudaMemcpy(b, cudaB, size, cudaMemcpyDeviceToHost);
	
	printf("\nSin of all the angles: ");
	for(int i = 0; i < n; i++){
		printf("%lf ", b[i]);
	}
	
	return;
}
