#include <stdio.h>
#include <stdlib.h>
#include <mpi.h>

void main(int argc, char* argv[]){
	int rank;
	int size;
	int num;
	
	MPI_Init(&argc, &argv);
	MPI_Comm_size(MPI_COMM_WORLD, &size);
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	MPI_Status status;
	
	if(rank == 0){
		fprintf(stdout, "Enter number : ");
		fscanf(stdin, "%d", &num);
		for(int i = 1; i < size; i++){
			MPI_Send(&num, 1, MPI_INT, i, 0, MPI_COMM_WORLD);
		}
	}
	else{
		MPI_Recv(&num, 1, MPI_INT, 0, 0, MPI_COMM_WORLD, &status);
		fprintf(stdout, "\nNumber received : %d", num);
	}
	
	MPI_Finalize();
	return;
}
