#include <stdio.h>
#include <stdlib.h>

typedef
struct Node {
	char* v;
	struct Node* left;
	struct Node* right;
	char flag;
} Node;

void print(Node* r) {
	Node* t; Node* tt;
	Node* initR = r;
	Node* p = NULL;

	do {
		if (r == NULL) {
			r = p;
			p = NULL;
		}
		else if (r->flag == 0) {
			printf("%s\n", r->v);
			r->flag = 1;
			t = p;
			p = r;
			r = r->left;
			p->left = t;
		}
		else if (r->flag == 1) {
			r->flag = 2;
			t = p;
			p = r;
			tt = r->left;
			r->left = t;
			r = r->right;
			p->right = tt;
		}
		else if (r->flag == 2) {
			t = p;
			p = r;
			tt = r->right;
			r->right = t;
			r = tt;
		}
	} while (r != initR || r == NULL || r->flag != 2);
}


int main(void) {
	Node* tree;

	tree = malloc(sizeof(Node));
	tree->v = "ROOT";
	tree->flag = 0;

	tree->left = malloc(sizeof(Node));
	tree->left->v = "L1";
	tree->left->flag = 0;
	tree->right = malloc(sizeof(Node));
	tree->right->v = "R1";
	tree->right->flag = 0;

	tree->left->left = NULL;
	tree->left->right = malloc(sizeof(Node));
	tree->left->right->v = "R2";
	tree->left->right->flag = 0;

	tree->left->right->left = malloc(sizeof(Node));
	tree->left->right->left->v = "L3";
	tree->left->right->left->flag = 0;
	tree->left->right->right = NULL;

	tree->right->left = NULL;
	tree->right->right = NULL;

	print(tree);

	return 0;
}
