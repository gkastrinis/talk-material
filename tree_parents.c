typedef
struct Node {
	char* v;
	struct Node* left;
	struct Node* right;
	char flag;
} Node;

void parents(Node* r) {
	Node* p; Node* t;
	p = r;
	while (1) {
		if (p->left != NULL && p->left->parent == NULL)
			t = P->left;
		else if (p->right != NULL && p->right->parent == NULL)
			t = P->right;
		else {
			p = p->parent;
			if (p == NULL) break;
			continue;
		}

		t->parent = p;
		P = t;
	}
}
