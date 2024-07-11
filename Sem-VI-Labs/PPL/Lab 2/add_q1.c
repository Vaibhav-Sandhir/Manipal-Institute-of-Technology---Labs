#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <mpi.h>

int isPrime(int num){
	if(num == 0 || num == 1){
		return 0;
	}
	if(num == 2){
		return 1;
	}
	for(int i = 2; i < num; i++){
		if(num % i == 0){
			return 0;
		}
	}
	return 1;
}
void main(int argc, char *argv[]){
	int rank;
	int size;
	
	MPI_Init(&argc, &argv);
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	MPI_Comm_size(MPI_COMM_WORLD, &size);
	MPI_Status status;
	int arr[size];
	int received;
	char ans[50];
	
	if(rank == 0){
		fprintf(stdout, "\nEnter %d elements: ", size);
		fflush(stdout);
		for(int i = 0; i < size; i++){
			scanf("%d", &arr[i]);
		}
		for(int i = 1; i < size; i++){
			MPI_Send(&arr[i], 1, MPI_INT, i, 0, MPI_COMM_WORLD);
		}
		int res = isPrime(arr[0]);
		strcpy(ans, (res == 0) ? "not prime" : "prime");
		printf("\nNumber %d is %s", arr[0], ans);
	}
	else{
		MPI_Recv(&received, 1, MPI_INT, 0, 0, MPI_COMM_WORLD, &status);
		int res = isPrime(received);
		strcpy(ans, (res == 0) ? "not prime" : "prime");	
		printf("\nNumber %d is %s", received, ans);
	}
	
	
	MPI_Finalize();
	return;	
}
