#include <iostream>
#include <fstream>
using namespace std;

int main(void)
{
	ofstream out("data2.txt");
	out << "Hello World" << endl;
	out << 1 << " www.facebook.com";
	int i; cin >> i;
	out.flush();
	out.close();
}
