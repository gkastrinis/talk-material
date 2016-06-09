#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

typedef
struct Node {
	char* v;
	struct Node* left;
	struct Node* right;
} Node;

void print(Node* r) {
	Node* t; Node* tt;
	Node* initR = r;
	Node* p = NULL;
	char flag;

	do {
		if (r != NULL) {
			flag = ((uintptr_t)r) & 3;
			r = (void*)(((uintptr_t)r) >> 2);
			r = (void*)(((uintptr_t)r) << 2);
		}

		if (r == NULL) {
			r = p;
			p = NULL;
		}
		else if (flag == 0) {
			printf("%s\n", r->v);
			t = p;
			p = r;
			r = r->left;
			p->left = t;
			p = (void*)(((uintptr_t)p) | 1);
		}
		else if (flag == 1) {
			t = p;
			p = r;
			tt = r->left;
			r->left = t;
			r = r->right;
			p->right = tt;
			p = (void*)(((uintptr_t)p) | 2);
		}
		else if (flag == 2) {
			t = p;
			p = r;
			tt = r->right;
			r->right = t;
			r = tt;
		}
	} while (r != initR || r == NULL || flag != 2);
}


int main(void) {
	Node* tree;

	tree = malloc(sizeof(Node));
	tree->v = "ROOT";

	tree->left = malloc(sizeof(Node));
	tree->left->v = "L1";
	tree->right = malloc(sizeof(Node));
	tree->right->v = "R1";

	tree->left->left = NULL;
	tree->left->right = malloc(sizeof(Node));
	tree->left->right->v = "R2";

	tree->left->right->left = malloc(sizeof(Node));
	tree->left->right->left->v = "L3";
	tree->left->right->right = NULL;

	tree->right->left = NULL;
	tree->right->right = NULL;

	print(tree);

	return 0;
}
