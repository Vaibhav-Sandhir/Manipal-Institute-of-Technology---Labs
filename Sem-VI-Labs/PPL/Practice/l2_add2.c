#include <stdio.h>
#include <stdlib.h>
#include <mpi.h>

int factorial(int n){
	if(n == 0 || n == 1){
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
	int ans;
	
	MPI_Init(&argc, &argv);
	MPI_Comm_size(MPI_COMM_WORLD, &size);
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	MPI_Status status;
	
	if(rank == 0){
		ans = 1;
		MPI_Send(&ans, 1, MPI_INT, 1, 0, MPI_COMM_WORLD);
		MPI_Recv(&ans, 1, MPI_INT, size - 1, 0, MPI_COMM_WORLD, &status);
		fprintf(stdout, "\n%d", ans);
	}
	else{
		MPI_Recv(&ans, 1, MPI_INT, rank - 1, 0, MPI_COMM_WORLD, &status);
		if(rank % 2 == 0){
			ans += factorial(rank + 1);
		}
		else{
			ans += sum(rank + 1);
		}
		MPI_Send(&ans, 1, MPI_INT, (rank + 1) % size, 0, MPI_COMM_WORLD);
	}
	
	MPI_Finalize();
	return;	
}
