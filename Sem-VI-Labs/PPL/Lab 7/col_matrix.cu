#include <stdio.h>
#include <stdlib.h>
#include <cuda_runtime.h>
#include <device_launch_parameters.h>

__global__ void add(int* matrix, int n, int m){
	int col = blockIdx.x;
	int k = threadIdx.x;
	int i = (col * n) + k;
	
	matrix[i] = matrix[i] + 1;
	return; 
}

int main(){
	int n;
	int m;
	printf("\nEnter rows and columns of the matrix: ");
	scanf("%d %d", &n, &m);
	int size = m * n * sizeof(int);
	int* matrix = (int*)malloc(size);
	printf("\nEnter matrix values column wise: ");
	for(int i = 0; i < m * n; i++){
		scanf("%d", &matrix[i]);
	}
	
	int* cudaMatrix;
	cudaMalloc(&cudaMatrix, size);
	cudaMemcpy(cudaMatrix, matrix, size, cudaMemcpyHostToDevice);
	dim3 dimGrid(m, 1, 1);
	dim3 dimBlock(n ,1 ,1);
	add <<<dimGrid, dimBlock>>> (cudaMatrix, n, m);
	cudaMemcpy(matrix, cudaMatrix, size, cudaMemcpyDeviceToHost);
	for(int i = 0; i < n * m; i++){
		printf("%d ", matrix[i]);
	}
	return 0;
}
