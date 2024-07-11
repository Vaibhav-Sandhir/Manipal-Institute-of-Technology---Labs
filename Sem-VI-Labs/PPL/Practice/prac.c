#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void main(int argc, char* argv[]){
	char* word = (char*)malloc(sizeof(char));
	scanf("%s", word);
	printf("%d", strlen(word));
}
