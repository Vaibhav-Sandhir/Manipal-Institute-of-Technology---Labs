#include <stdio.h>
#include <stdlib.h>
#include <mpi.h>
#define MCW MPI_COMM_WORLD

void main(int argc, char* argv[]){
	int rank;
	int size;
	int matrix[4][4];
	int row[4];
	int partial[4];
	int ans[4][4];
	
	MPI_Init(&argc, &argv);
	MPI_Comm_size(MCW, &size);
	MPI_Comm_rank(MCW, &rank);
	
	if(rank == 0){
		fprintf(stdout, "\nEnter 16 elements : ");
		for(int i = 0; i < 4; i++){
			for(int j = 0; j < 4; j++){
				fscanf(stdin, "%d", &matrix[i][j]);
			}
		}
	}
	
	MPI_Scatter(matrix, 4, MPI_INT, row, 4, MPI_INT, 0, MCW);
	MPI_Scan(row, partial, 4, MPI_INT, MPI_SUM, MCW);
	MPI_Gather(partial, 4, MPI_INT, ans, 4, MPI_INT, 0, MCW);
	
	if(rank == 0){
		for(int i = 0; i < 4; i++){
			for(int j = 0; j < 4; j++){
				fprintf(stdout, "%d ", ans[i][j]);
			}
			fprintf(stdout, "\n");
		}
	}
	
	MPI_Finalize();
	return;
}
