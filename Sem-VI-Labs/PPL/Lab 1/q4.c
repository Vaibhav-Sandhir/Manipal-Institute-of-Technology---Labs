#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<mpi.h>

void main(int argc, char * argv[]){
	int rank;
	int size;
	
	MPI_Init(&argc, &argv);
	
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	MPI_Comm_size(MPI_COMM_WORLD, &size);
	char arr[] = "HeLlo";
	
	int index = rank;
	if(index >= strlen(arr)){
		printf("\nIncorrect index");
		return;
	}
	if(arr[index] >= 97){
		arr[index] = arr[index] - 32;
	}
	else{
		arr[index] = arr[index] + 32;
	}
	printf("\n%s", arr);
	
	MPI_Finalize();
	return;
}
