#include <stdio.h>
#include <stdlib.h>
#include <mpi.h>

int factorial(int n){
	if(n == 0 || n == 1){
		return 1;
	}
	
	return n * factorial(n - 1);
}

void handleErrors(int error_code){
	if(error_code != MPI_SUCCESS){
		char error_string[256];
		int error_class;
		int length;
		MPI_Error_class(error_code, &error_class);
		MPI_Error_string(error_code, error_string, &length);
		fprintf(stdout, "%d %s", error_class, error_string);
	}
}

void main(int argc, char* argv[]){
	int rank;
	int size;
	int ans = 0;
	
	MPI_Init(&argc, &argv);
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	int code = MPI_Comm_size(MPI_COMM_WORLD, &size);
	handleErrors(code);
	
	int num = factorial(rank + 1);
	MPI_Reduce(&num, &ans, 1, MPI_INT, MPI_SUM, 0, MPI_COMM_WORLD);
	if(rank == 0){
		fprintf(stdout, "%d", ans);
	}
	
	MPI_Finalize();
	return;
}
