#include <mpi.h>
#include <stdio.h>
MPI_Status status;

void recurse(int rank, int num);

void main(int argc, char *argv[]){
	int rank;
	int size;
	int num;
	
	MPI_Init(&argc, &argv);
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	MPI_Comm_size(MPI_COMM_WORLD, &size);

	if(rank == 0){
		scanf("%d", &num);
		num += 1;
		MPI_Ssend(&num, 1, MPI_INT, 1, 0, MPI_COMM_WORLD);
		MPI_Recv(&num, 1, MPI_INT, size - 1, 0, MPI_COMM_WORLD, &status);
		fprintf(stdout, "Final number is : %d", num);
		fflush(stdout);
	}
	else{
		MPI_Recv(&num, 1, MPI_INT, rank - 1, 0, MPI_COMM_WORLD, &status);
		num += 1;
		MPI_Ssend(&num, 1, MPI_INT, (rank + 1) % size, 0, MPI_COMM_WORLD);
	}
	
	MPI_Finalize();
	return;
}

