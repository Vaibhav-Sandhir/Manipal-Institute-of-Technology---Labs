#include <stdio.h>
#include <stdlib.h>
#include <mpi.h>

int factorial(int n){
	if(n == 1){
		return 1;
	}
	return n * factorial(n - 1);
}

int sum(int n){
	return (n * (n + 1)) / 2;
}

void main(int argc, char* argv[]){
	int rank;
	int size;
	int prev = 0;

	MPI_Init(&argc, &argv);
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	MPI_Comm_size(MPI_COMM_WORLD, &size);
	MPI_Status status;
	
	if(rank == 0){
		int ans = 1;
		MPI_Ssend(&ans, 1, MPI_INT, rank + 1, 0, MPI_COMM_WORLD);
		MPI_Recv(&prev, 1, MPI_INT, size - 1, 0, MPI_COMM_WORLD, &status);
		printf("\nValue for the sequence is %d", prev);
	}
	else if(rank % 2 != 0){
		MPI_Recv(&prev, 1, MPI_INT, rank - 1, 0, MPI_COMM_WORLD, &status);
		int ans = prev + sum(rank + 1);
		MPI_Ssend(&ans, 1, MPI_INT, (rank + 1) % size, 0, MPI_COMM_WORLD);
	}
	else{
		MPI_Recv(&prev, 1, MPI_INT, rank - 1, 0, MPI_COMM_WORLD, &status);
		int ans = prev + factorial(rank + 1);
		MPI_Ssend(&ans, 1, MPI_INT, (rank + 1) % size, 0, MPI_COMM_WORLD);
	}
	
	MPI_Finalize();
	return;
}
