#include <iostream>
#include <cstdlib>
using namespace std;

int main(int argc, char* argv[]) {
	int i;
	if ( argc == 1 ) i = 0;
	else i = atoi(argv[1]);
	for (int j = 20 ; j > i ; j--)
		cout << j << endl;
	//cout << "last value for j: " << j << endl;
}
