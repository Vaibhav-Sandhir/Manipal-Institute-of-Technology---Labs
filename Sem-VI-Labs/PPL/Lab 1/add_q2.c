#include<stdio.h>
#include<stdlib.h>
#include<mpi.h>

void printPrimes(int start, int end);

void main(int argc, char * argv[]){
	int rank;
	int size;
	
	MPI_Init(&argc, &argv);
	
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	MPI_Comm_size(MPI_COMM_WORLD, &size);
	
	if(rank == 0){
		printPrimes(0, 49);
	}
	else{
		printPrimes(50, 100);
	}
	
	MPI_Finalize();
	return;
}

void printPrimes(int start, int end){

	for(int num = start; num <= end; num++){
		int flag = (num == 0 || num == 1) ? 0 : 1;
		for(int i = 2; i < num; i++){
			if(num % i == 0){
				flag = 0;
				break;
			}
		}
		if(flag){
			printf("  %d", num);
		}
	}
	return;
}
