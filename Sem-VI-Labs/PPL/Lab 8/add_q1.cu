#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <cuda_runtime.h>
#include <device_launch_parameters.h>

__global__ void reverse(char* str, int* pos){
	int id = threadIdx.x;
	int ind = 2 * id;
	int l = pos[ind];
	int r = pos[ind + 1];
	char temp;
	while(l <= r){
		temp = str[l];
		str[l] = str[r];
		str[r] = temp;
		l++;
		r--;
	}
	return;
}

int main(){
	char* str = (char*)malloc(1024 * sizeof(char));
	printf("\nEnter a string: ");
	fgets(str, 1024, stdin);
	int n = strlen(str);
	str[n] = '\0';
	char* ans = (char*)malloc(n * sizeof(char));
	int* pos = (int*)malloc(1024* sizeof(int));
	pos[0] = 0;
	int j = 1;
	for(int i = 0; i < n; i++){
		if(str[i] == ' '){
			pos[j++] = i - 1;
			pos[j++] = i + 1;
		}
	}
	pos[j++] = n - 1;
	pos[j] = '\0';
	int threads = j / 2;
	char* cudaStr;
	int* cudaPos;
	cudaMalloc(&cudaStr, n * sizeof(char));
	cudaMalloc(&cudaPos, j * sizeof(int));
	cudaMemcpy(cudaStr, str, n * sizeof(char), cudaMemcpyHostToDevice);
	cudaMemcpy(cudaPos, pos, j * sizeof(int), cudaMemcpyHostToDevice);
	reverse<<<1, threads>>> (cudaStr, cudaPos);
	cudaMemcpy(ans, cudaStr, n * sizeof(char), cudaMemcpyDeviceToHost);
	printf("\nReversed String is : %s", ans);
	return 0;
}
