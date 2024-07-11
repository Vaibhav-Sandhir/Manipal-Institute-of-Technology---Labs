#include <stdio.h>
#include <stdlib.h>
#include <mpi.h>

void main(int argc, char *argv[]){
	int rank;
	int size;
	int m;
	int arr[256];
	
	MPI_Init(&argc, &argv);
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	MPI_Comm_size(MPI_COMM_WORLD, &size);
	
	if(rank == 0){
		fprintf(stdout, "\nEnter m (multiple of %d): ", size);
		fflush(stdout);
		scanf("%d", &m);
		fprintf(stdout, "\nEnter %d values : ", size * m);
		fflush(stdout);
		for(int i = 0; i < m * size; i++){
			scanf("%d", &arr[i]);
		}
	}
	
	MPI_Bcast(&m, 1, MPI_INT, 0, MPI_COMM_WORLD);
	int subarr[m];
	int ans[m * size];
	MPI_Scatter(arr, m, MPI_INT, subarr, m, MPI_INT, 0, MPI_COMM_WORLD);
	for(int i = 0; i < m; i++){
		if(subarr[i] % 2 == 0){
			subarr[i] = 1;
		}
		else{
			subarr[i] = 0;
		}
	}
	MPI_Gather(subarr, m, MPI_INT, ans, m, MPI_INT, 0, MPI_COMM_WORLD);
	
	if(rank == 0){
		fprintf(stdout, "Final array is : ");
		fflush(stdout);
		for(int i = 0; i < m * size; i++){
			printf("  %d", ans[i]);
		}
	}	
	
	MPI_Finalize();
	return;
}
