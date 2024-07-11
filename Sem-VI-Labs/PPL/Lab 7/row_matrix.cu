#include <stdio.h>
#include <stdlib.h>
#include <cuda_runtime.h>
#include <device_launch_parameters.h>

__global__ void sort(int* cudaMatrix, int n, int m){
	int i = blockIdx.x;
	int j = threadIdx.x;
	int ind = (i * m) + j;
	cudaMatrix[ind] = cudaMatrix[ind] + 1;
	return;
}

int main(){
	int n;
	int m;
	printf("\nEnter number of and rows and columns: ");
	scanf("%d %d", &n, &m);
	int size = (n * m * sizeof(int));
	int* matrix = (int*)malloc(size);
	int* cudaMatrix;
	printf("\nEnter values of the matrix: ");
	for(int i = 0; i < n * m; i++){
		scanf("%d", &matrix[i]);
	}
	cudaMalloc(&cudaMatrix, size);
	cudaMemcpy(cudaMatrix, matrix, size, cudaMemcpyHostToDevice);
	dim3 dimGrid(n, 1, 1);
	dim3 dimBlock(m, 1, 1);
	
	sort <<<dimGrid, dimBlock>>> (cudaMatrix, n, m);
	cudaMemcpy(matrix, cudaMatrix, size, cudaMemcpyDeviceToHost);
	for(int i = 0; i < n * m; i++){
		printf("%d ", matrix[i]);
	}
	return 0;
}
