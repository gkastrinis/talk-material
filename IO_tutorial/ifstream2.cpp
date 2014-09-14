#include <iostream>
#include <fstream>
using namespace std;

int main(void)
{
	ifstream in("data.txt");
	in.seekg(0, ios::end);
	cout << "File size is: " << in.tellg() << endl;
}
