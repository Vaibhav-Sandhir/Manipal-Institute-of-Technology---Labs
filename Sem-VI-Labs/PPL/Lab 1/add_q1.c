#include<stdlib.h>
#include<stdio.h>
#include<mpi.h>

void main(int argc, char * argv[]){
	int rank;
	int size;
	
	MPI_Init(&argc, &argv);
	
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	MPI_Comm_size(MPI_COMM_WORLD, &size);
	
	int arr[] = {18, 523, 301, 1234, 2, 14, 108, 150, 1928};
	int i = rank;
	if(i >= 9){
		printf("\nInvalid Index");
		return;
	}
	int num = arr[i];
	int ans = 0;
	
	while(num > 0){
		int digit = num % 10;
		ans = ans * 10 + digit;
		num = num / 10;
	}
	
	arr[i] = ans;
	for(int j = 0; j < 9; j++){
		printf(" %d", arr[j]);
	}
	printf("\n");
	
	MPI_Finalize();
	return;
}
