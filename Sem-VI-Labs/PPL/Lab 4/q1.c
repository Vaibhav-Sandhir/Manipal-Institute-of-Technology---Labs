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
		fprintf(stdout, " %d %s", error_class, error_string);
		fflush(stdout);
	}
}

void main(int argc, char *argv[]){
	int rank;
	int size;
	int total = 0;
	
	MPI_Init(&argc, &argv);
	MPI_Errhandler_set(MPI_COMM_WORLD, MPI_ERRORS_RETURN);
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	int code = MPI_Comm_size(MPI_COMM_WORLD, &size);
	handleErrors(code);
	
	int fact = factorial(rank + 1);
	
	MPI_Scan(&fact, &total, 1, MPI_INT, MPI_SUM, MPI_COMM_WORLD);
	
	if(rank == size - 1){
		fprintf(stdout, "\nSum of all factorials is : %d", total);
		fflush(stdout);
	}
	
	MPI_Finalize();
	return;
}
