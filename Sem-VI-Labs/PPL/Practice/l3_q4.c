#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <mpi.h>

void main(int argc, char* argv[]){
	int rank;
	int size;
	char str1[256];
	char str2[256];
	int part;
	
	MPI_Init(&argc, &argv);
	MPI_Comm_size(MPI_COMM_WORLD, &size);
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	
	if(rank == 0){
		fprintf(stdout, "\nEnter 1st string with length divisible by %d : ", size);
		fscanf(stdin, "%s", str1);
		fprintf(stdout, "\nEnter 2nd string with same length : ");
		fscanf(stdin, "%s", str2);
		part = strlen(str1) / size;
		str1[strlen(str1)] = '\0';
		str2[strlen(str2)] = '\0'; 
	}
	
	MPI_Bcast(&part, 1, MPI_INT, 0, MPI_COMM_WORLD);
	char substr1[part];
	char substr2[part];
	char ans[2 * (part * size)];
	char subans[2 * part];
	int k = 0;
	MPI_Scatter(str1, part, MPI_CHAR, substr1, part, MPI_CHAR, 0, MPI_COMM_WORLD);
	MPI_Scatter(str2, part, MPI_CHAR, substr2, part, MPI_CHAR, 0, MPI_COMM_WORLD);
	substr1[part] = '\0';
	substr2[part] = '\0';
	for(int i = 0; i < part; i++){
		subans[k++] = substr1[i];
		subans[k++] = substr2[i];
	}
	subans[k] = '\0';
	MPI_Gather(subans, 2 * part, MPI_CHAR, ans, 2 * part, MPI_CHAR, 0, MPI_COMM_WORLD);
	
	if(rank == 0){
		ans[2 * part * size] = '\0';
		fprintf(stdout, "\nFinal String is : %s", ans);
	}
	
	MPI_Finalize();
	return;
}

