#include <stdio.h>
#include <stdlib.h>

typedef struct Node *Nodeptr;

typedef struct Node{
    int data;
    Nodeptr lchild;
    Nodeptr rchild;
} Node;

Nodeptr getnode(){
    Nodeptr node = (Node*)malloc(sizeof(Node));
    return node;
}

Nodeptr CreateBST(Nodeptr root, int item){
if (root==NULL){
root = getnode();
root->data= item;
root->lchild=root->rchild = NULL;
return root;
}
else if (item<root->data)
root->lchild = CreateBST(root->lchild, item);
else if (item>root->data)
root->rchild = CreateBST(root->rchild, item);
else
printf("Duplicates are not allowed\n");
return root;
}

void inorder(Nodeptr root){
    if(root != NULL){
        inorder(root->lchild);
        printf("  %d",root->data);
        inorder(root->rchild);
    }
}

void preorder(Nodeptr root){
    if(root){
        printf("  %d",root->data);
        preorder(root->lchild);
        preorder(root->rchild);
    }
}

void postorder(Nodeptr root){
    if(root){
        postorder(root->lchild);
        postorder(root->rchild);
        printf("  %d",root->data);
    }
}

void search(Nodeptr root, int key){
    Nodeptr current;
    Nodeptr parent;
    current = root;
    int flag = 0;
    while(current != NULL){
        parent = current;
        if(key > current->data)
            current = current->rchild;
        else if(key < current->data)
            current = current->lchild;
        else{
            printf("\nKey Found!");
            flag = 1;
            break;
        }        
    }
    if(flag == 0){
        Nodeptr temp = getnode();
        temp->data = key;
        if(key > parent->data)
            parent->rchild = temp;
        else
            parent->lchild = temp;    
    }
}

void main(){
    Nodeptr root = NULL;
    int i;
    int n;
    int x;
    int key;
    printf("\nEnter how many nodes: ");
    scanf("%d",&n);
    for(i = 0;i<n; i++){
        printf("\nEnter value for the node: ");
        scanf("%d",&x);
        root = CreateBST(root,x);
    }
    printf("\nInorder traversal is :\n");
    inorder(root);
    printf("\nPreorder traversal is :\n");
    preorder(root);
    printf("\nPostorder traversal is :\n");
    postorder(root);
    printf("\nEnter key to be searched:\n");
    scanf("%d",&key);
    search(root,key);
    printf("\nInorder traversal is :\n");
    inorder(root);
}
