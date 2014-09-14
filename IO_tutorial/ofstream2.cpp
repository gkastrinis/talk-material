#include <iostream>
#include <fstream>
#include <cstdlib>
using namespace std;

int main(void)
{
	ofstream out("data2.txt");
	out << "Hello World" << endl;
	out << 1 << " www.facebook.com";
	int i; cin >> i;
	out << endl;
	out.close();
}
