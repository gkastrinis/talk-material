#include <iostream>
#include <fstream>
#include <string>
using namespace std;

class Person
{
	int id;
	int age;
	string name;

public:

	Person (int id_, int age_, string name_) : id(id_), age(age_), name(name_) {}
	Person () {}

	friend istream& operator >> (istream&, Person&);
	friend ostream& operator << (ostream&, Person&);
};

istream& operator >> (istream& in, Person& p)
{
	in >> p.id >> p.age >> p.name;
	return in;
}

ostream& operator << (ostream& out, Person& p)
{
	out << "Person with id: " << p.id << ", age: " << p.age << ", name: " << p.name << endl;
	return out;
}


int main ()
{
	Person p1, p2;
	cin >> p1 >> p2;
	cout << p1 << p2 << endl;
}
