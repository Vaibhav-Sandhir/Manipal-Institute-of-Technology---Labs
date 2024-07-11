#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <mpi.h>

void main(int argc, char* argv[]){
	int rank;
	int size;
	char string[256];
	int part;
	
	MPI_Init(&argc, &argv);
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	MPI_Comm_size(MPI_COMM_WORLD, &size);
	
	if(rank == 0){
		fprintf(stdout, "\nEnter a string whose length is divisible by %d: ", size);
		fscanf(stdin, "%s", string);
		part = strlen(string) / size;
		string[strlen(string)] = '\0';
	}
	
	MPI_Bcast(&part, 1, MPI_INT, 0, MPI_COMM_WORLD);
	char substring[part];
	int counts[size];
	MPI_Scatter(string, part, MPI_CHAR, substring, part, MPI_CHAR, 0, MPI_COMM_WORLD);
	substring[part] = '\0';
	fprintf(stdout, "\n%s", substring);
	int count = 0;
	for(int i = 0; i < part; i++){
		char c = substring[i];
		if(c != 'a' && c != 'e' && c != 'i' && c != 'o' && c != 'u'){
			count++;
		}
	}
	MPI_Gather(&count, 1, MPI_INT, counts, 1, MPI_INT, 0, MPI_COMM_WORLD);
	
	if(rank == 0){
		int res = 0;
		for(int i = 0; i < size; i++){
			res += counts[i];
		}
		fprintf(stdout, "\nTotal non-vowels : %d", res);
	}
	
	MPI_Finalize();
	return;
}
