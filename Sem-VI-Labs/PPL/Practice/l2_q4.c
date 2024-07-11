#include <stdio.h>
#include <stdlib.h>
#include <mpi.h>

void main(int argc, char* argv[]){
	int rank;
	int size;
	int num;
	
	MPI_Init(&argc, &argv);
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	MPI_Comm_size(MPI_COMM_WORLD, &size);
	MPI_Status status;
	
	if(rank == 0){
		fprintf(stdout, "Enter Number : ");
		fscanf(stdin, "%d", &num);
		MPI_Send(&num, 1, MPI_INT, 1, 0, MPI_COMM_WORLD);
		MPI_Recv(&num, 1, MPI_INT, size - 1, 0, MPI_COMM_WORLD, &status);
		fprintf(stdout, "%d", num);
	}
	
	else{
		MPI_Recv(&num, 1, MPI_INT, rank - 1, 0, MPI_COMM_WORLD, &status);
		num++;
		MPI_Send(&num, 1, MPI_INT, (rank + 1) % size, 0, MPI_COMM_WORLD);
	}
	
	
	MPI_Finalize();
	return;
}
