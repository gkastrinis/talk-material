#include <iostream>
#include <sstream>
#include <string>
using namespace std;

int parseInt(string text)
{
	istringstream is(text);
	int tmp;
	is >> tmp;
	return tmp;
}

int main(int argc, char* argv[])
{
	if (argc != 1)
		cout << "Int argument: " << parseInt(argv[1]) << endl;
}
