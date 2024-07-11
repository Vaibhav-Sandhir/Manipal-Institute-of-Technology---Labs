#include <stdio.h>
#include <stdlib.h>
#include <mpi.h>

void findPrimes(int start, int end);

void main(int argc, char* argv[]){
	int rank;
	int size;
	
	MPI_Init(&argc, &argv);
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	MPI_Comm_size(MPI_COMM_WORLD, &size);
	
	switch(rank){
		case 0:
			findPrimes(1, 49);
			break;
		case 1:
			findPrimes(50, 100);
			break;	
	}
	
	MPI_Finalize();
	return;	
}

void findPrimes(int start, int end){
	for(int i = start; i <= end; i++){
		int flag = 1;
		for(int j = 2; j * j < i; j++){
			if(i % j == 0){
				flag = 0;
				break;
			}
		}
		if((flag || i == 2) && i != 1){
			fprintf(stdout, "%d  ", i);
		}
	}
}


