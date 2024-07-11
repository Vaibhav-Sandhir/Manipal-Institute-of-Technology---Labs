#include <mpi.h>
#include <stdio.h>
#include <string.h>

void main(int argc, char* argv[]){
	int rank;
	int size;
	char word1[256];
	char word2[256];
	int n1;
	int n2;
	MPI_Status status;
	
	MPI_Init(&argc, &argv);
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	MPI_Comm_size(MPI_COMM_WORLD, &size);
	
	if(rank == 0){
		printf("\nEnter word in Master process : ");
		scanf("%s", word1);
		n1 = strlen(word1);
		word1[n1] = '\0';
		MPI_Ssend(&n1, 1, MPI_INT, 3, 0, MPI_COMM_WORLD);
		MPI_Ssend(word1, n1, MPI_CHAR, 3, 0, MPI_COMM_WORLD);
		MPI_Recv(word1, n1, MPI_CHAR, 3, 0, MPI_COMM_WORLD, &status);
		fprintf(stdout, "%s", word1);
		fflush(stdout);
	}
	else if(rank == 3){
		MPI_Recv(&n2, 1, MPI_INT, 0, 0, MPI_COMM_WORLD, &status);
		MPI_Recv(word2, n2, MPI_CHAR, 0, 0, MPI_COMM_WORLD, &status);
		for(int i = 0; i < n2; i++){
			if(word2[i] >= 'A' && word2[i] <= 'Z'){
				word2[i] += 32;
			}
			else if(word2[i] >= 'a' && word2[i] <= 'z'){
				word2[i] -= 32;
			}	
		}
		MPI_Ssend(word2, n2, MPI_CHAR, 0, 0, MPI_COMM_WORLD);
	}
	
	MPI_Finalize();
	return;
}
