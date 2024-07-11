#include <mpi.h>
#include <stdio.h>
#include <stdlib.h>

void main(int argc, char * argv[]){
	int rank;
	int size;
	int x;
	int y;
	MPI_Status status;
	
	MPI_Init(&argc, &argv);
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	MPI_Comm_size(MPI_COMM_WORLD, &size);
	
	if(rank == 0){
		printf("\nEnter value in the master porcess : ");
		scanf("%d", &x);
		MPI_Send(&x, 1, MPI_INT, 3, 0, MPI_COMM_WORLD);
		fprintf(stdout, "\nI have sent %d from Process 0", x);
		fflush(stdout);
	}
	else{
		MPI_Recv(&y, 1, MPI_INT, 0, 0, MPI_COMM_WORLD, &status);
		fprintf(stdout, "\nI have received %d in process 3", y);
		fflush(stdout);
		exit(0);
	}
	MPI_Finalize();
}
