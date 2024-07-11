#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <mpi.h>

void main(int argc, char *argv[]){
	int rank;
	int size;
	int part;
	char str1[256];
	char str2[256];
	
	MPI_Init(&argc, &argv);
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	MPI_Comm_size(MPI_COMM_WORLD, &size);
	
	if(rank == 0){
		printf("\nEnter string  of length (any multiple of %d): ", size);
		scanf("%s", str1);
		printf("\nEnter string  of length (any multiple of %d): ", size);
		scanf("%s", str2);
		str1[strlen(str1)] = '\0';
		str2[strlen(str2)] = '\0';
		part = strlen(str1) / size;
	}
	
	MPI_Bcast(&part, 1, MPI_INT, 0, MPI_COMM_WORLD);
	char sub1[part];
	char sub2[part];
	char concat[2 * part];
	char ans[2 * part * size];
	MPI_Scatter(str1, part, MPI_CHAR, sub1, part, MPI_CHAR, 0, MPI_COMM_WORLD);
	MPI_Scatter(str2, part, MPI_CHAR, sub2, part, MPI_CHAR, 0, MPI_COMM_WORLD);
	int ind = 0;
	for(int i = 0; i < part; i++){
		concat[ind++] = sub1[i];
		concat[ind++] = sub2[i]; 
	}
	MPI_Gather(concat, 2 * part, MPI_CHAR, ans, 2 * part, MPI_CHAR, 0, MPI_COMM_WORLD);
	
	if(rank == 0){
		ans[2 * part * size] = '\0';
		fprintf(stdout, "%s", ans);
		fflush(stdout);
	}
	
	MPI_Finalize();
	return;
}
