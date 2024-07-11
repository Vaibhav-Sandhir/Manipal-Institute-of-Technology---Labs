#include <stdio.h>
#include <stdlib.h>
#include <mpi.h>

int factorial(int n){
	if(n == 0 || n == 1){
		return 1;
	}
	
	return n * factorial(n - 1);
}

void main(int argc, char* argv[]){
	int rank;
	int size;
	
	MPI_Init(&argc, &argv);
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	MPI_Comm_size(MPI_COMM_WORLD, &size);
	
	int num;
	int* arr = (int*)malloc(sizeof(int) * size);
	
	if(rank == 0){
		fprintf(stdout, "\nEnter %d numbers : ", size);
		for(int i = 0; i < size; i++){
			fscanf(stdin, "%d", (arr + i));
		}
	}
	
	MPI_Scatter(arr, 1, MPI_INT, &num, 1, MPI_INT, 0, MPI_COMM_WORLD);
	int res = factorial(num);
	MPI_Gather(&res, 1, MPI_INT, arr, 1, MPI_INT, 0, MPI_COMM_WORLD);
	
	if(rank == 0){
		int sum = 0;
		for(int i = 0; i < size; i++){
			sum += *(arr + i);
		}
		fprintf(stdout, "\nSum of all factorials is %d", sum);
	}
	
	MPI_Finalize();
	return;
}
