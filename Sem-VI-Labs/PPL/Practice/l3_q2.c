#include <stdio.h>
#include <stdlib.h>
#include <mpi.h>

void main(int argc, char* argv[]){
	int rank;
	int size;
	int m;
	int* arr;
	int* subarr;
	int* avgs;
	int res = 0;
	int avg = 0;
	
	MPI_Init(&argc, &argv);
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	MPI_Comm_size(MPI_COMM_WORLD, &size);
	
	if(rank == 0){
		fprintf(stdout, "\nEnter m : ");
		fscanf(stdin, "%d", &m);
		arr = (int*)malloc(sizeof(int) * m * size);
		fprintf(stdout, "\nEnter %d elements : ", m * size);
		for(int i = 0; i < m * size; i++){
			fscanf(stdin, "%d", (arr + i));
		}
	}
	
	subarr = (int*)malloc(sizeof(int) * m);
	avgs = (int*)malloc(sizeof(int) * size);
	MPI_Bcast(&m, 1, MPI_INT, 0, MPI_COMM_WORLD);
	MPI_Scatter(arr, m , MPI_INT, subarr, m, MPI_INT, 0, MPI_COMM_WORLD);
	
	for(int i = 0; i < m; i++){
		avg += *(subarr + i);
	}
	avg = avg / m;
	MPI_Gather(&avg, 1, MPI_INT, avgs, 1, MPI_INT, 0, MPI_COMM_WORLD);
	
	if(rank == 0){
		for(int i = 0; i < size; i++){
			res += *(avgs + i);
		}
		res = res / size;
		fprintf(stdout, "\nFinal answers : %d", res);
	}
	
	MPI_Finalize();
	return;
}
