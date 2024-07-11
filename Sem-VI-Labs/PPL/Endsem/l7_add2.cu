#include <stdio.h>
#include <stdlib.h>
#include <cuda_runtime.h>
#include <device_launch_parameters.h>

__global__ void sort(int* matrix, int* ans){
	int start_row = blockIdx.x * blockDim.x;
	int end_row = start_row + blockDim.x;
	int pos = start_row;
	int ind = start_row + threadIdx.x;
	int num = matrix[ind];
	for(int i = start_row; i < end_row; i++){
		if(matrix[i] > num || (matrix[i] == num && ind > i)){
			pos++;
		}
	}
	ans[pos] = num;
	return;
}

int main(){
	int m;
	int n;
	printf("\nEnter how many rows and columns: ");
	scanf("%d %d", &n, &m);
	int size = m * n * sizeof(int);
	int* matrix = (int*)malloc(size);
	int* ans = (int*)malloc(size);
	printf("\nEnter elements of the matrix: ");
	for(int i = 0; i < m * n; i++){
		scanf("%d", &matrix[i]);	
	}
	int* cudaMatrix;
	int* cudaAns;
	cudaMalloc(&cudaMatrix, size);
	cudaMalloc(&cudaAns, size);
	cudaMemcpy(cudaMatrix, matrix, size, cudaMemcpyHostToDevice);
	sort <<<m, n>>> (cudaMatrix, cudaAns);
	cudaMemcpy(ans, cudaAns, size, cudaMemcpyDeviceToHost);
	for(int i = 0; i < m * n; i++){
		printf("%d ", ans[i]);	
	}
}
