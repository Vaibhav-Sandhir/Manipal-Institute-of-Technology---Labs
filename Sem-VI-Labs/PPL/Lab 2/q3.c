#include <mpi.h>
#include <stdio.h>

void main(int argc, char* argv[]){
	int rank;
	int size;
	
	MPI_Init(&argc, &argv);
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	MPI_Comm_size(MPI_COMM_WORLD, &size);
	MPI_Status status;
	int arr[size];
	int msg;
	int bufferSize = 256;
	int buffer[256];
	
	if(rank == 0){
		for(int i = 0; i < size; i++){
			fprintf(stdout, "\nEnter element %d : ", i);
			fflush(stdout);
			scanf("%d", &arr[i]);
		}
		for(int i = 0; i < size; i++){
			MPI_Buffer_attach(buffer, bufferSize);
			MPI_Bsend(&arr[i], 1, MPI_INT, i, 0, MPI_COMM_WORLD);
			MPI_Buffer_detach(&buffer, &bufferSize);
		}
	}
	if(rank % 2 == 0){
		MPI_Recv(&msg, 1, MPI_INT, 0, 0, MPI_COMM_WORLD, &status);
		fprintf(stdout, "\nIn rank %d recevied %d", rank, msg * msg);
		fflush(stdout);
	}
	else{
		MPI_Recv(&msg, 1, MPI_INT, 0, 0, MPI_COMM_WORLD, &status);
		fprintf(stdout, "\nIn rank %d recevied %d", rank, msg * msg * msg);
		fflush(stdout);
	}
	
	MPI_Finalize();
	return;
}
