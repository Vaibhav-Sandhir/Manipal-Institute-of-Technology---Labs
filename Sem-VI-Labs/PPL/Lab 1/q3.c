#include<stdio.h>
#include<stdlib.h>
#include<mpi.h>

void main(int argc, char * argv[]){
	int rank;
	int size;
	
	MPI_Init(&argc, &argv);
	
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	MPI_Comm_size(MPI_COMM_WORLD, &size);
	int a = 9;
	int b = 4;
	
	switch(rank){
		case 0:
			printf("\n a + b = %d", a + b);
			break;
		case 1:
			printf("\n a - b = %d", a - b);
			break;
		case 2:
			printf("\n a * b = %d", a * b);
			break;
		case 3:
			printf("\n a / b = %lf", a / (double)b);
			break;
		default:
			break;					
	}
	
	MPI_Finalize();
	return;
}
