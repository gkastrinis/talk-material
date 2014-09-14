#include <iostream>
using namespace std;

int main(void)
{
	cout << "Give a positive number and a character:";

	int number;
	char c;
	cin >> number >> c;

	if ( number > 0 )
		cout << number << " - " << c << endl;
	else
		cerr << "Non-positive number" << endl;
}
