#include <stdio.h>
#include <stdlib.h>
#include <cuda_runtime.h>
#include <device_launch_parameters.h>

__global__ void sort(int* matrix, int* ans, int n, int m){
	int i = blockIdx.x;
	int j = threadIdx.x;
	int ind = (i * m) + j;
	int start_of_row = (i * m);
	int end_of_row = (i * m) + m;
	int pos = start_of_row;
	int num = matrix[ind];
	for(int k = start_of_row; k < end_of_row; k++){
		if(num < matrix[k] || (num == matrix[k] && k < ind)){
			pos++;
		}
	}
	ans[pos] = num;
	return;
}

int main(){
	int n;
	int m;
	printf("\nEnter number of rows and columns: ");
	scanf("%d %d", &n, &m);
	int size = (n * m * sizeof(int));
	int* matrix = (int*)malloc(size);
	int* ans = (int*)malloc(size);
	int* cudaMatrix;
	int* cudaAns;
	printf("\nEnter values of the matrix: ");
	for(int i = 0; i < n * m; i++){
		scanf("%d", &matrix[i]);
	}
	cudaMalloc(&cudaMatrix, size);
	cudaMalloc(&cudaAns, size);
	cudaMemcpy(cudaMatrix, matrix, size, cudaMemcpyHostToDevice);
	dim3 dimGrid(n, 1, 1);
	dim3 dimBlock(m, 1, 1);
	sort <<<dimGrid, dimBlock>>> (cudaMatrix, cudaAns, n, m);
	cudaMemcpy(ans, cudaAns, size, cudaMemcpyDeviceToHost);
	for(int i = 0; i < n * m; i++){
		printf("%d ", ans[i]);
	}
	return 0;
}
