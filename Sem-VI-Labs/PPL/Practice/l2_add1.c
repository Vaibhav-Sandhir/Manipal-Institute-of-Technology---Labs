#include <stdio.h>
#include <stdlib.h>
#include <mpi.h>

int isPrime(int num){
	if(num == 2){
		return 1;
	}
	if(num == 1 || num == 0){
		return 0;
	}
	
	for(int i = 2; i * i <= num; i++){
		if(num % i == 0){
			return 0;
		}
	}
	
	return 1;
}

void main(int argc, char* argv[]){
	int rank;
	int size;
	int num;
	
	MPI_Init(&argc, &argv);
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	MPI_Comm_size(MPI_COMM_WORLD, &size);
	MPI_Status status;
	
	if(rank == 0){
		int* arr = (int*)malloc(sizeof(int) * size);
		fprintf(stdout, "Enter %d elements : ", size);
		for(int i = 0; i < size; i++){
			fscanf(stdin, "%d", (arr + i));
		}
		for(int i = 0; i < size; i++){
			MPI_Send((arr + i), 1, MPI_INT, i, 0, MPI_COMM_WORLD);
		}
	}
	
	MPI_Recv(&num, 1, MPI_INT, 0, 0, MPI_COMM_WORLD, &status);
	if(isPrime(num)){
		fprintf(stdout, "\n%d is a prime number", num);
	}
	else{
		fprintf(stdout, "\n%d is not a prime number", num);
	}
	
	MPI_Finalize();
	return;
}
