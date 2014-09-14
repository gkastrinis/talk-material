#include <iostream>
#include <fstream>
#include <string>
using namespace std;

int main(void)
{
	fstream tmp("data4.txt", ios::out);
	tmp.close();
	fstream file("data4.txt", ios::in | ios::out);
	file << 1 << " www.photobucket.com" << endl;
	file << 2 << " www.deviantart.com" << endl;
	file.seekg(0, ios::beg);
	int i;
	string site;
	file >> i >> site;
	cout << i << " " << site << endl;
}
