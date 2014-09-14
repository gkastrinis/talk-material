#include <iostream>
#include <sstream>
#include <string>
using namespace std;

string toString(int i)
{
	ostringstream os;
	os << "Integer " << i;
	return os.str();
}

string toString(double d)
{
	ostringstream os;
	os << "Double " << d;
	return os.str();
}

int main(void)
{
	int i;
	cin >> i;
	cout << "Read: " << toString(i) << endl;
	double d;
	cin >> d;
	cout << "Read: " << toString(d) << endl;
}
