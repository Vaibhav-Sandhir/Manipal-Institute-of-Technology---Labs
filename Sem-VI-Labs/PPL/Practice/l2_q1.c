#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <mpi.h>

void main(int argc, char* argv[]){
	int rank;
	int size;
	char* word = (char*)malloc(100 * sizeof(char));
	
	MPI_Init(&argc, &argv);
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	MPI_Comm_size(MPI_COMM_WORLD, &size);
	MPI_Status status;
	
	switch(rank){
		case 0:
			fprintf(stdout, "\nEnter a word: ");
			fscanf(stdin, "%s", word);
			fprintf(stdout, "\n%s", word);
			MPI_Ssend(word, strlen(word), MPI_CHAR, 1, 0, MPI_COMM_WORLD);
			MPI_Recv(word, strlen(word), MPI_CHAR, 1, 0, MPI_COMM_WORLD, &status);
			fprintf(stdout, "\nToggeled string is %s", word);
			break;
		case 1:
			MPI_Recv(word, strlen(word), MPI_CHAR, 0, 0, MPI_COMM_WORLD, &status);
			for(int i = 0; i < strlen(word); i++){
				char c = *(word + i);
				if(c >= 'a' && c <= 'z'){
					c = c - 32;
				}
				else{
					c = c + 32;
				}
				*(word + i) = c;
			}
			MPI_Ssend(word, strlen(word), MPI_CHAR, 0, 0, MPI_COMM_WORLD);
			break;
	}
	
	MPI_Finalize();
	return;
}
