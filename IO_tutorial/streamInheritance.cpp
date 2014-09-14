#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
using namespace std;


void readStream(istream& in)
{
	while (true)
	{
		string line;
		getline(in, line);
		if ( in.eof() ) break;
		cout << line << endl;
	}
}

int main(void)
{
	cout << "\nReading from standard input" << endl;
	readStream(cin);
	ifstream in("data.txt");
	cout << "\nReading from a file" << endl;
	readStream(in);
	string s("1 www.google.com\n2 www.twitter.com\n3 www.ebay.com\n");
	istringstream is(s);
	cout << "\nReading from a string" << endl;
	readStream(is);
}
