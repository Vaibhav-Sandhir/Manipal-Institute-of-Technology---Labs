#include <stdio.h>
#include <stdlib.h>
#include <mpi.h>

void main(int argc, char *argv[]){
    int rank;
    int size;

    MPI_Init(&argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &size);

    int num1 = atoi(argv[1]);
    int num2 = atoi(argv[2]);
    int ans = 0;
    
    switch(rank){
    	case 0:
    		ans = num1 + num2;
    		fprintf(stdout, "%d + %d = %d\n", num1, num2, ans);
    		break;
    	case 1:
    		ans = num1 - num2;
    		fprintf(stdout, "%d - %d = %d\n", num1, num2, ans);
    		break;
    	case 2:
    		ans = num1 * num2;
    		fprintf(stdout, "%d * %d = %d\n", num1, num2, ans);
    		break;
    	case 3:
    		double res = (double)num1 / num2;
    		fprintf(stdout, "%d / %d = %lf\n", num1, num2, res);
    		break;				
    }
    
    MPI_Finalize();
    return;
}

