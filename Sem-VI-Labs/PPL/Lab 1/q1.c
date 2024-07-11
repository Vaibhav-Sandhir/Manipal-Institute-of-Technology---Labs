#include<stdio.h>
#include<stdlib.h>
#include<math.h>
#include<mpi.h>

void main(int argc, char* argv[]){
	int rank;
	int size;
	
	MPI_Init(&argc, &argv);
	
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	MPI_Comm_size(MPI_COMM_WORLD, &size);
	
	int x = 4;
	printf("\n %d raise to the power of %d is %lf", x, rank, pow(x, rank));
	
	
	MPI_Finalize();
	return;
}
