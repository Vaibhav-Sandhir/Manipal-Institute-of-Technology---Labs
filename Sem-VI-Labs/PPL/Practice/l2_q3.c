#include <stdio.h>
#include <stdlib.h>
#include <mpi.h>

void main(int argc, char* argv[]){
	int rank;
	int size;
	
	MPI_Init(&argc, &argv);
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	MPI_Comm_size(MPI_COMM_WORLD, &size);
	MPI_Status status;
	int num;
	
	if(rank == 0){
		int bufferSize = 256;
		int* arr = (int*)malloc(sizeof(int) * size);
		int* buffer = (int*)malloc(sizeof(int) * bufferSize);
		fprintf(stdout, "Enter %d elements : ", size);
		for(int i = 0; i < size; i++){
			fscanf(stdin, "%d", (arr + i));
		}
		for(int i = 0; i < size; i++){
			MPI_Buffer_attach(buffer, bufferSize);
			MPI_Bsend((arr + i), 1, MPI_INT, i, 0, MPI_COMM_WORLD);
			MPI_Buffer_detach(&buffer, &bufferSize);
		}
	}
	
	if(rank % 2 == 0){
		MPI_Recv(&num, 1, MPI_INT, 0, 0, MPI_COMM_WORLD, &status);
		fprintf(stdout, "\nSquare of %d is %d", num, num * num);
	}
	else{
		MPI_Recv(&num, 1, MPI_INT, 0, 0, MPI_COMM_WORLD, &status);
		fprintf(stdout, "\nCube of %d is %d", num, num * num * num);	
	}
	
	MPI_Finalize();
	return;
}
