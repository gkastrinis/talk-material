#include <iostream>
#include <fstream>
using namespace std;

int main(void)
{
	ifstream in("data.txt");
	while (true)
	{
		int i;
		char buf[24];
		in >> buf >> i;
		if ( !in.good() ) { cerr << "Problem" << endl; break; }
		cout << i << " " << buf << endl;
	}
}
