// Each column of resultant matrix is computed by one thread
/* m1 = 2  3  1  (2 x 3) (n x m)
        4  5  7 */
        
/* m2 = 1  8  5  (3 x 3) (p x q)
        4  2  7
        9  6  3 */
        
// m3 = (2 x 3) (n x q)
// m1 and m2 will be represented in a row major format

#include <stdio.h>
#include <stdlib.h>
#include <cuda_runtime.h>
#include <device_launch_parameters.h>

__global__ void matmul(int* m1, int* m2, int* m3, int n, int m, int q){
	int cid_m2 = threadIdx.x;
	int sum;
	for(int rid_m1 = 0; rid_m1 < n; rid_m1++){
		sum = 0;
		for(int k = 0; k < m; k++){
			sum += m1[rid_m1 * m + k] * m2[k * q + cid_m2];
		}
		m3[rid_m1 * q + cid_m2] = sum;
	}
	return;
}


int main(){
	int n = 2;
	int m = 3;
	int p = 3;
	int q = 3;
	int m1[] = {2, 3, 1, 4, 5, 7};
	int m2[] = {1, 8, 5, 4, 2, 7, 9, 6, 3};
	int* m3 = (int*)malloc(n * q * sizeof(int));
	int* cudaM1;
	int* cudaM2;
	int* cudaM3;
	cudaMalloc(&cudaM1, n * m * sizeof(int));
	cudaMalloc(&cudaM2, p * q * sizeof(int));
	cudaMalloc(&cudaM3, n * q * sizeof(int));
	cudaMemcpy(cudaM1, m1, n * m * sizeof(int), cudaMemcpyHostToDevice);
	cudaMemcpy(cudaM2, m2, p * q * sizeof(int), cudaMemcpyHostToDevice);
	dim3 dimGrid(1, 1, 1);
	dim3 dimBlock(q, 1, 1);
	matmul <<<dimGrid, dimBlock>>> (cudaM1, cudaM2, cudaM3, n, m, q);
	cudaMemcpy(m3, cudaM3, n * q * sizeof(int), cudaMemcpyDeviceToHost);
	for(int i = 0; i < n * p; i++){
		printf("%d ", m3[i]);
	}
	return 0;
}

        
                        
