#include <iostream>
#include <fstream>
#include <string>
using namespace std;

int main(void)
{
	fstream file("data3.txt", ios::in | ios::out);
	file << 1 << " www.photobucket.com" << endl;
	file << 2 << " www.deviantart.com" << endl;
	file.seekg(0, ios::beg);
	int i;
	string site;
	file >> i >> site;
	cout << i << " " << site << endl;
}
