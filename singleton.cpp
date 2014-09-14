#include <iostream>
using namespace std;

class Egg {
	static Egg e;
	int i;
	Egg(int ii) : i(ii) { cout << "Constr" << endl; }
	Egg(const Egg&);
public:
	static Egg* instance() { return &e; }
	int val () const { return i; }
};

Egg Egg::e(47);

int main() {
	cout << "Main" << endl;
	cout << Egg::instance()->val() << endl;
}
