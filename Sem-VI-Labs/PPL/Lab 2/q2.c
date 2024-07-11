#include<mpi.h>
#include<stdio.h>

void main(int argc, char* argv[]){
	int rank;
	int size;
	int msg;
	
	MPI_Init(&argc, &argv);
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	MPI_Comm_size(MPI_COMM_WORLD, &size);
	MPI_Status status;
	
	if(rank == 0){
		for(int i = 1; i < size; i++){
			MPI_Send(&i, 1, MPI_INT, i, 0, MPI_COMM_WORLD);
		}
	}
	else{
		MPI_Recv(&msg, 1, MPI_INT, 0, 0, MPI_COMM_WORLD, &status);
		fprintf(stdout, "\n%d received in%d\n", msg, rank);
		fflush(stdout);
	}
	
	MPI_Finalize();
	return;
}
