#include <stdio.h>
#include <stdlib.h>
#include <mpi.h>

int factorial(int n){
	if(n == 0 || n == 1){
		return 1;
	}
	
	return n * factorial(n - 1);
}

void main(int argc, char *argv[]){
	int rank;
	int size;
	int total = 0;
	
	MPI_Init(&argc, &argv);
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	MPI_Comm_size(MPI_COMM_WORLD, &size);
	
	int fact = factorial(rank + 1);
	
	MPI_Reduce(&fact, &total, 1, MPI_INT, MPI_SUM, 0, MPI_COMM_WORLD);
	
	if(rank == 0){
		fprintf(stdout, "\nSum of all factorials is %d", total);
		fflush(stdout);
	}
	
	MPI_Finalize();
	return;
}
