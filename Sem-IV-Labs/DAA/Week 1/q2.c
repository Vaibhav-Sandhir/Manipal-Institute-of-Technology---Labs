#include <stdio.h>
#include <stdlib.h>

typedef struct Node* Nodeptr;

typedef struct Node{
   Nodeptr next;
   char data;
}Node;

Nodeptr getNode(){
   Nodeptr node = (Node*)malloc(sizeof(Node));
   return node;
}

void insert_back(Nodeptr *head, char data)
{
    Nodeptr p;
    p = *head;
    Nodeptr temp = getNode();
    temp->data = data;
    while (p->next != NULL)
    {
        p = p->next;
    }
    p->next = temp;
}

void display(Nodeptr head)
{
    Nodeptr p = head->next;
    while (p != NULL)
    {
        if(p->next == NULL){
        printf(" %c ", p->data);
        p = p->next;
        }
        else{
        printf(" %c ->", p->data);
        p = p->next;
        }
    }
    printf("\n");
}

void main(){
Nodeptr head = getNode();
head->data = NULL;
int vertices;
int i;
int j;
int ans;
char temp;
printf("\nHow many vertices does the graph have:\n");
scanf("%d",&vertices);
int matrix[vertices][vertices];
int ch = 65;
for(i =0;i<vertices;i++){
	for(j =0;j<vertices;j++){
             printf("Does %c have a connection with %c [1/0]:",i+65,j+65);
             scanf("%d",&ans);
             if(ans == 1)
             	matrix[i][j] = 1;
             else
             	matrix[i][j] = 0;		  	
	}
   }
   for(i =0;i<vertices;i++){
   	for(j =0;j<vertices;j++){
   	      printf("  %d",matrix[i][j]);
   	}
   	printf("\n");
   }
   for(i =0;i<vertices;i++){
     temp = i + 65;
     insert_back(&head,temp);
   	for(j =0;j<vertices;j++){
   	      if(matrix[i][j] == 1){
   	      temp = j +65;
   	          insert_back(&head,temp);
   	      }	      
   	}
   	display(head);
   	head = getNode();
   }
}
