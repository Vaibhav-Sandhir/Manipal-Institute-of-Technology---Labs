#include <stdio.h>
#include <stdlib.h>
#include <mpi.h>

int factorial(int n){
	if(n == 1 || n == 0){
		return 1;
	}
	return n * factorial(n - 1); 
}

void main(int argc, char *argv[]){
	int rank;
	int size;
	int num;
	
	MPI_Init(&argc, &argv);
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	MPI_Comm_size(MPI_COMM_WORLD, &size);
	
	int nums[size];
	int ans[size];
	if(rank == 0){
		printf("\nEnter %d numbers", size);
		for(int i = 0; i < size; i++){
			scanf("%d", &nums[i]);
		}
	}
	
	MPI_Scatter(nums, 1, MPI_INT, &num, 1, MPI_INT, 0, MPI_COMM_WORLD);
	fprintf(stdout, "\nReceived %d in %d", num, rank);
	fflush(stdout);
	
	num = factorial(num);
	
	MPI_Gather(&num, 1, MPI_INT, ans, 1, MPI_INT, 0, MPI_COMM_WORLD);
	
	if(rank == 0){
		int sum = 0;
		for(int i = 0; i < size; i++){
			sum += ans[i];
		}
		fprintf(stdout, "\nThe sume of all factorials are : %d", sum);
		fflush(stdout);
	}
	
	MPI_Finalize();
	return;
}
