#include <stdio.h>
#include <stdlib.h>
#include <mpi.h>

void main(int argc, char* argv[]){
	int rank;
	int size;
	int arr[] = {18, 523, 301, 1234, 2, 14, 108, 150, 1928};
	
	MPI_Init(&argc, &argv);
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	MPI_Comm_size(MPI_COMM_WORLD, &size);
	
	int num = arr[rank];
	int orig = num;
	int rev = 0;
	while(num > 0){
		int digit = num % 10;
		rev = rev * 10 + digit;
		num = num / 10;
	}
	fprintf(stdout, "\n%d -> %d", orig, rev);
	MPI_Finalize();
	return;
}
