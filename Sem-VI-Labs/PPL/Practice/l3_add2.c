#include <stdio.h>
#include <stdlib.h>
#include <mpi.h>

void main(int argc, char* argv[]){
	int rank;
	int size;
	
	
	MPI_Init(&argc, &argv);
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	MPI_Comm_size(MPI_COMM_WORLD, &size);
	
	int* arr = (int*)malloc(sizeof(int) * size);
	int* ans = (int*)malloc(sizeof(int) * size);
	int num;
	
	if(rank == 0){
		fprintf(stdout, "\nEnter %d numbers: ", size);
		for(int i = 0; i < size; i++){
			fscanf(stdin, "%d", (arr + i));
		}
	}
	MPI_Scatter(arr, 1, MPI_INT, &num, 1, MPI_INT, 0, MPI_COMM_WORLD);
	if(num % 2 == 0){
		num = 1;
	}
	else{
		num = 0;
	}
	MPI_Gather(&num, 1, MPI_INT, ans, 1, MPI_INT, 0, MPI_COMM_WORLD);
	
	if(rank == 0){
		for(int i = 0; i < size; i++){
			fprintf(stdout, "%d ", *(ans + i));
		}
	}
	
	MPI_Finalize();
	return;
}
