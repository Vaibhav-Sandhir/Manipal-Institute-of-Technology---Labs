#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <mpi.h>

void main(int argc, char *argv[]){
	int rank;
	int size;
	char str[256];
	int part;
	int consonants = 0;
	int ans[256];
	
	MPI_Init(&argc, &argv);
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	MPI_Comm_size(MPI_COMM_WORLD, &size);
	
	if(rank == 0){
		printf("\nEnter string  of length (any multiple of %d): ", size);
		scanf("%s", str);
		str[strlen(str)] = '\0';
		part = strlen(str) / size;
	}
	MPI_Bcast(&part, 1, MPI_INT, 0, MPI_COMM_WORLD);
	char substring[part];
	MPI_Scatter(str, part, MPI_CHAR, substring, part, MPI_CHAR, 0, MPI_COMM_WORLD);
	substring[part] = '\0';
	printf("\n%s", substring);
	for(int i = 0; i < part; i++){
		if(substring[i] != 'a' && substring[i] != 'e' && substring[i] != 'i' && 
		   substring[i] != 'o' && substring[i] != 'u'){
		   	consonants++;
		   }
	}
	MPI_Gather(&consonants, 1, MPI_INT, ans, 1, MPI_INT, 0, MPI_COMM_WORLD);
	
	if(rank == 0){
		int total = 0;
		for(int i = 0; i < size; i++){
			printf(" %d", ans[i]);
			total += ans[i];
		}
		fprintf(stdout, "\nTotal consonants are %d", total);
		fflush(stdout);
	}
	
	MPI_Finalize();
	return;
}
