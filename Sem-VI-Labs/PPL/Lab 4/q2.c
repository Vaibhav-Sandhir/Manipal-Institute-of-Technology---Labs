#include <stdio.h>
#include <stdlib.h>
#include <mpi.h>

double f(double x){
	return 4.0 / (1.0 + x * x);
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

void main(int argc, char* argv[]){
	int rank;
	int size;
	double n = 10000;
	double h = 1.0 / n;
	double local_sum = 0.0;
	double pi = 0.0;
	
	MPI_Init(&argc, &argv);
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	int code = MPI_Comm_size(MPI_COMM_WORLD, &size);
	handleErrors(code);
	
	for(int i = rank; i < n; i += size){
		double x = (i + 0.5) * h;
		local_sum += f(x) * h;
	}
	
	MPI_Reduce(&local_sum, &pi, 1, MPI_DOUBLE, MPI_SUM, 0, MPI_COMM_WORLD);
	
	if(rank == 0){
		fprintf(stdout, "\nPI approximation is %lf", pi);
		fflush(stdout);
	}
	
	MPI_Finalize();
	return;
}
