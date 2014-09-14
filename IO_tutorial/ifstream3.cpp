#include <iostream>
#include <fstream>
#include <string>
using namespace std;

int main(void)
{
	ifstream in("data.txt");
	while (true)
	{
		string line;
		getline(in, line);
		if ( in.eof() ) break;
		cout << line << endl;
	}
	in.clear();
	in.seekg(0, ios::beg);
	string line;
	while (!getline(in, line).eof())
		cout << line << endl;
}
