#include<stdio.h>
#include<stdlib.h>
#include<mpi.h>

void main(int argc, char *argv[]){
	int rank;
	int size;
	
	MPI_Init(&argc, &argv);
	
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	MPI_Comm_size(MPI_COMM_WORLD, &size);
	
	if(rank % 2 == 0){
		printf("\nHello Rank : %d",rank);
	}
	else{
		printf("\nWorld Rank : %d", rank);
	}
	
	MPI_Finalize();
	return;
}
