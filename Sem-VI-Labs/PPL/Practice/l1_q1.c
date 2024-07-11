#include <stdio.h>
#include <mpi.h>
#include <stdlib.h>
#include <math.h>

void main(int argc, char* argv[]){
	int rank;
	int size;
	int x = atoi(argv[1]);
	
	MPI_Init(&argc, &argv);
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	MPI_Comm_size(MPI_COMM_WORLD, &size);
	
	int ans = pow(x, rank);
	fprintf(stdout, " %d in rank %d\n", ans, x);
	MPI_Finalize();
	return;
}
