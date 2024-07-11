#include <stdio.h>
#include <stdlib.h>
#include <mpi.h>

void main(int argc, char* argv[]){
	int rank;
	int size;
	int m;
	int* arr;
	
	MPI_Init(&argc, &argv);
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	MPI_Comm_size(MPI_COMM_WORLD, &size);
	
	if(rank == 0){
		fprintf(stdout, "\nEnter m : ");
		fscanf(stdin, "%d", &m);
		arr = (int*)malloc(sizeof(int) * size * m);
		fprintf(stdout, "\nEnter %d numbers : ", size * m);
		for(int i = 0; i < size * m; i++){
			fscanf(stdin, "%d", (arr + i));
		}
	}
	
	MPI_Bcast(&m, 1, MPI_INT, 0, MPI_COMM_WORLD);
	int* subarr = (int*)malloc(sizeof(int) * m);
	MPI_Scatter(arr, m, MPI_INT, subarr, m, MPI_INT, 0, MPI_COMM_WORLD);
	if(rank % 2 == 0){
		for(int i = 0; i < m; i++){
			int num = *(subarr + i);
			*(subarr + i) = num * num;
		}
	}
	else{
		for(int i = 0; i < m; i++){
			int num = *(subarr + i);
			*(subarr + i) = num * num * num;
		}
	}
	MPI_Gather(subarr, m, MPI_INT, arr, m, MPI_INT, 0, MPI_COMM_WORLD);
	
	if(rank == 0){
		for(int i = 0; i < size * m; i++){
			fprintf(stdout, "%d ", *(arr + i));
		}
	}
	
	MPI_Finalize();
	return;
}
