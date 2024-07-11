#include <stdio.h>
#include <stdlib.h>
#include <mpi.h>

void handleErrors(int error_code){
	if(error_code != MPI_SUCCESS){
		char error_string[256];
		int error_class;
		int length;
		MPI_Error_class(error_code, &error_class);
		MPI_Error_string(error_code, &error_string, &length);
		fprintf(stdout, "%d %s", error_class, error_string);
	}
}

void main(int argc, char* argv[]){
	int rank;
	int size;
	int target;
	int matrix[3][3];
	int freq = 0;
	int ans = 0;
	int* row = (int*)malloc(sizeof(int) * 3);
	
	MPI_Init(&argc, &argv);
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	int code = MPI_Comm_size(MPI_COMM_WORLD, &size);
	handleErrors(code);
	
	if(rank == 0){
		fprintf(stdout, "\nEnter 9 elements : ");
		for(int i = 0; i < 3; i++){
			for(int j = 0; j < 3; j++){
				fscanf(stdin, "%d", &matrix[i][j]);
			}
		}
		fprintf(stdout, "\nEnter a target: ");
		fscanf(stdin, "%d", &target);
	}
	
	MPI_Bcast(&target, 1, MPI_INT, 0, MPI_COMM_WORLD);
	MPI_Scatter(matrix, 3, MPI_INT, row, 3, MPI_INT, 0, MPI_COMM_WORLD);
	
	for(int i = 0; i < 3; i++){
		if(*(row + i) == target){
			freq++;
		}
	}
	MPI_Reduce(&freq, &ans, 1, MPI_INT, MPI_SUM, 0, MPI_COMM_WORLD);
	
	if(rank == 0){
		fprintf(stdout, "%d", ans);
	}
	
	MPI_Finalize();
	return;
}
