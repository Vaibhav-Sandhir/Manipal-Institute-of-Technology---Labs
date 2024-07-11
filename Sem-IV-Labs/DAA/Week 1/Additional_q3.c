#include <stdio.h>
#include <stdlib.h>

typedef struct Node *Nodeptr;

typedef struct Node{
    Nodeptr llink;
    Nodeptr rlink;
    int data;
}Node;


Nodeptr getNode(){
    Nodeptr node = (Node*)malloc(sizeof(Node));
    return node;
}

void insert_back(Nodeptr *head, int data)
{
    Nodeptr temp = getNode();
    temp->data = data;
    Nodeptr p = *head;
    while (p->rlink != NULL)
    {
        p = p->rlink;
    }
    p->rlink = temp;
    temp->llink = p;
}

void display(Nodeptr head)
{
    Nodeptr p = head->rlink;
    while (p != NULL)
    {
        printf(" %d ->", p->data);
        p = p->rlink;
    }
    printf("\n");
}

Nodeptr createTreeRecursive(int item)
{
    int x;

    if (item != -1)
    {
        Nodeptr temp = getNode();
        temp->data = item;

        printf("\nEnter Left Child of %d : ", item);
        scanf("%d", &x);
        temp->llink = createTreeRecursive(x);

        printf("\nEnter Right Child of %d : ", item);
        scanf("%d", &x);
        temp->rlink = createTreeRecursive(x);

        return temp;
    }
    return NULL;
}

void inorder(Nodeptr root,Nodeptr *head)
{
    if (root)
    {
        inorder(root->llink,head);
        printf("  %d", root->data);
        insert_back(head,root->data);
        inorder(root->rlink,head);
    }
}

void main(){
    Nodeptr head = getNode();
    head->data = NULL;
    Nodeptr root = NULL;
    int item;
    printf("\nEnter the root: ");
    scanf("%d", &item);
    root = createTreeRecursive(item);
    printf("\nTree is :");
    inorder(root,&head);
    printf("\nList is ");
    display(head);
}
