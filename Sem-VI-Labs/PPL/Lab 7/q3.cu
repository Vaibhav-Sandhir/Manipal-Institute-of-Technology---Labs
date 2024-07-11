#include <cuda_runtime.h>
#include <device_launch_parameters.h>
#include <stdio.h>

__global__ void convolution1D(double* arr, double* mask, double* res, int m, int n){
	int i = threadIdx.x + (blockIdx.x * blockDim.x);
	
	double value = 0;
	int start_point = i - (m / 2);
	for(int j = 0; j < m; j++){
		int ind = start_point + j;
		if(ind >= 0 && ind < n){
			value += arr[ind] * mask[j];
		}
	}
	res[i] = value;
}

int main(){
	int n;
	int m;
	printf("\nEnter length of the array: ");
	scanf("%d", &n);
	printf("\nEnter length of the mask: ");
	scanf("%d", &m);
	
	double* arr = (double*)malloc(sizeof(double) * n);
	double* mask = (double*)malloc(sizeof(double) * m);
	double* res = (double*)malloc(sizeof(double) *  n);
	
	printf("\nEnter element of the array: ");
	for(int i = 0; i < n; i++){
		scanf("%lf", &arr[i]);
	}
	
	printf("\nEnter elements of the mask: ");
	for(int i = 0; i < m; i++){
		scanf("%lf", &mask[i]);
	}
	
	double* cudaArr;
	double* cudaMask;
	double* cudaRes;
	
	cudaMalloc(&cudaArr, sizeof(double) * n);
	cudaMalloc(&cudaMask, sizeof(double) * m);
	cudaMalloc(&cudaRes, sizeof(double) * n);
	
	cudaMemcpy(cudaArr, arr, sizeof(double) * n, cudaMemcpyHostToDevice);
	cudaMemcpy(cudaMask, mask, sizeof(double) * m, cudaMemcpyHostToDevice);
	
	convolution1D<<<1, n>>> (cudaArr, cudaMask, cudaRes, m, n);
	
	cudaMemcpy(res, cudaRes, sizeof(double) * n, cudaMemcpyDeviceToHost);
	
	for(int i = 0; i < n; i++){
		printf("%lf ", res[i]);
	}
	
	return 0;
}
