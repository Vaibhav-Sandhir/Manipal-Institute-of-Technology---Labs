#include <cuda_runtime.h>
#include <device_launch_parameters.h>
#include <stdio.h>

__global__ void addVectors(int* a, int* b, int* c){
	int i = threadIdx.x + blockIdx.x * blockDim.x;
	c[i] = a[i] + b[i];
}

int main(){
	int n;
	printf("\nEnter number of length of the vectors: ");
	scanf("%d", &n);

	
	int* a = (int*)malloc(sizeof(int) * n);
	int* b = (int*)malloc(sizeof(int) * n);
	int* c = (int*)malloc(sizeof(int) * n);
	
	printf("\nEnter values of 1st vector: ");
	for(int i = 0; i < n; i++){
		scanf("%d", &a[i]);
	}
	printf("\nEnter values of 2nd vector: ");
	for(int i = 0; i < n; i++){
		scanf("%d", &b[i]);
	}
	
	int* cudaA;
	int* cudaB;
	int* cudaC;
	
	cudaMalloc(&cudaA, sizeof(int) * n);
	cudaMalloc(&cudaB, sizeof(int) * n);
	cudaMalloc(&cudaC, sizeof(int) * n);
	
	// Destination source size direction
	cudaMemcpy(cudaA, a, sizeof(int) * n, cudaMemcpyHostToDevice);
	cudaMemcpy(cudaB, b, sizeof(int) * n, cudaMemcpyHostToDevice);
	
	// Grid Size Block Size
	addVectors<<<n, 1>>> (cudaA, cudaB, cudaC);
	// Cpu reads this as execute function addVectors in a cuda Kernel with grid size n and block size 1 with these parameters
	
	cudaMemcpy(c, cudaC, sizeof(int) * n, cudaMemcpyDeviceToHost);
	
	for(int i = 0; i < n; i++){
		printf("%d ", c[i]);
	}  
	
	return 0;
}
