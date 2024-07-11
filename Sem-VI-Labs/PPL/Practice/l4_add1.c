#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <mpi.h>

void main(int argc, char* argv[]){
	int rank;
	int size;
	
	MPI_Init(&argc, &argv);
	MPI_Comm_size(MPI_COMM_WORLD, &size);
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	MPI_Status status;
	char* str = (char*)malloc(sizeof(char) * size);
	int n = (size * (size + 1)) / 2;
	char* ans = (char*)malloc(sizeof(char) * n);
	char c;
	
	if(rank == 0){
		fprintf(stdout, "\nEnter String of length %d: ", size);
		fscanf(stdin, "%s", str);
	}
	
	MPI_Scatter(str, 1, MPI_CHAR, &c, 1, MPI_CHAR, 0, MPI_COMM_WORLD);
	char* subans = (char*)malloc(sizeof(char) * (rank + 1));
	char* temp = (char*)malloc(sizeof(char) * (rank + 1));
	for(int i = 0; i < rank + 1; i++){
		*(subans + i) = c;
	}
	*(subans + rank + 1) = '\0';
	MPI_Send(subans, rank + 1, MPI_CHAR, 0, 0, MPI_COMM_WORLD);
	
	if(rank == 0){
		int k = 0;
		for(int i = 0; i < size; i++){
			MPI_Recv(temp, i + 1, MPI_CHAR, i, 0, MPI_COMM_WORLD, &status);
			*(temp + i + 1) = '\0';
			for(int j = 0; j < i + 1; j++){
				*(ans + k) = *(temp + j);
				k++;
			}
		}
		fprintf(stdout, "\nFinal String : %s", ans);
	}
	
	MPI_Finalize();
	return;
}
