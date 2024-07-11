#include <stdio.h>
#include <stdlib.h>
#include <mpi.h>

void main(int argc, char *argv[]){
	int rank;
	int size;
	int m;
	int nums[256];
	
	MPI_Init(&argc, &argv);
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	MPI_Comm_size(MPI_COMM_WORLD, &size);
	
	if(rank == 0){
		printf("\nEnter m : ");
		scanf("%d", &m);
		int n = m * size;
		printf("\nEnter %d elements : ", n);
		for(int i = 0; i < n; i++){
			scanf("%d", &nums[i]);
		}
	}
	
	MPI_Bcast(&m, 1, MPI_INT, 0, MPI_COMM_WORLD);
	int arr[m];
	int ans[size];
	MPI_Scatter(nums, m, MPI_INT, arr, m, MPI_INT, 0, MPI_COMM_WORLD);
	int avg = 0;
	for(int i = 0; i < m; i++){
		avg += arr[i];
	}
	avg = avg / m;
	
	MPI_Gather(&avg, 1, MPI_INT, ans, 1, MPI_INT, 0, MPI_COMM_WORLD);
	
	if(rank == 0){
		int final_avg = 0;
		for(int i = 0; i < size; i++){
			final_avg += ans[i];
		}
		final_avg = final_avg / size;
		fprintf(stdout, "Final average is %d", final_avg);
		fflush(stdout);
	}
	
	MPI_Finalize();
	return;
}
