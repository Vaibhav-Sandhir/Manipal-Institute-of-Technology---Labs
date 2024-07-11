#include <stdio.h>
#include <stdlib.h>
#include <mpi.h>

void main(int argc, char* argv[]){
	int rank;
	int size;
	
	MPI_Init(&argc, &argv);
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	MPI_Comm_size(MPI_COMM_WORLD, &size);
	
	char* str = argv[1];
	
	char c = *(str + rank);
	if(c >= 'a' && c <= 'z'){
		c = c - 32;
	}
	else{
		c = c + 32;
	}
	*(str + rank) = c;
	
	fprintf(stdout, "\n%s", str);
	
	MPI_Finalize();
	return;
}
