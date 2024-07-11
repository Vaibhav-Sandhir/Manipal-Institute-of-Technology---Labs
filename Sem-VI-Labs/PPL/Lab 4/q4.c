#include <stdio.h>
#include <stdlib.h>
#include <mpi.h>

void main(int argc, char* argv[]){
	int rank;
	int size;
	int m = 4;
	int n = 4;
	int matrix[4][4];
	int row[4];
	int partial[4];
	int ans[4][4];
	
	MPI_Init(&argc, &argv);
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	MPI_Comm_size(MPI_COMM_WORLD, &size);
	
	if(rank == 0){
		fprintf(stdout, "\nEnter %d elements : ", m * n);
		fflush(stdout);
		for(int i = 0; i < m; i++){
			for(int j = 0; j < n; j++){
				scanf("%d", &matrix[i][j]);
			}
		}
	}
	
	MPI_Scatter(matrix, 4, MPI_INT, row, 4, MPI_INT, 0, MPI_COMM_WORLD);
	MPI_Scan(row, partial, 4, MPI_INT, MPI_SUM, MPI_COMM_WORLD);
	MPI_Gather(partial, 4, MPI_INT, ans, 4, MPI_INT, 0, MPI_COMM_WORLD);
	
	if(rank == 0){
		for(int i = 0; i < m; i++){
			for(int j = 0; j < n; j++){
				printf("%d  ", ans[i][j]);
			}
		printf("\n");	
		}
	}
	
}
