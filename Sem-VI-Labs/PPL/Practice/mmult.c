#include <stdio.h>
#include <stdlib.h>
#include <mpi.h>

int SIZE = 3; 

void matrix_fill(int matrix[][SIZE], int value) {
    for (int i = 0; i < SIZE; i++) {
        for (int j = 0; j < SIZE; j++) {
            matrix[i][j] = value;
            value++;
        }
    }
}

void matrix_print(int matrix[][SIZE]) {
    for (int i = 0; i < SIZE; i++) {
        for (int j = 0; j < SIZE; j++) {
            printf("%d\t", matrix[i][j]);
        }
        printf("\n");
    }
}

int main(int argc, char* argv[]) {
    int rank, size;
    int A[SIZE][SIZE], B[SIZE][SIZE], C[SIZE], temp[SIZE], ans[SIZE][SIZE];

    MPI_Init(&argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &size);


    if (rank == 0) {
        matrix_fill(A, 1);
        matrix_fill(B, 1);
    }

    MPI_Bcast(B, SIZE * SIZE, MPI_INT, 0, MPI_COMM_WORLD);
    MPI_Scatter(A, SIZE , MPI_INT, temp, SIZE , MPI_INT, 0, MPI_COMM_WORLD);
    fprintf(stdout, "\n");
    for(int i = 0; i < size; i++){
    	fprintf(stdout, "%d ", temp[i]);
    }

    for(int j = 0; j < SIZE; j++) {
     	C[j] = 0;
        for (int k = 0; k < SIZE; k++) {
        	C[j] += temp[k] * B[k][j];
        }
    }

    MPI_Gather(C, SIZE , MPI_INT, ans, SIZE , MPI_INT, 0, MPI_COMM_WORLD);

    if (rank == 0) {
        fprintf(stdout, "Matrix A:\n");
        matrix_print(A);
        fprintf(stdout, "\nMatrix B:\n");
        matrix_print(B);
        fprintf(stdout, "\nMatrix C (Result of Multiplication):\n");
        matrix_print(ans);
    }

    MPI_Finalize();
    return 0;
}

