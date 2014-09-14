#include <iostream>
#include <fstream>
#include <string>
using namespace std;

int main(void)
{
	ifstream in("data.txt");
	while (true)
	{
		int i;
		string site;
		in >> i;
		in.ignore(5);
		getline(in, site, '.');
		in.ignore(3);
		if ( in.eof() ) break;
		cout << i << " " << site << endl;
	}
}
