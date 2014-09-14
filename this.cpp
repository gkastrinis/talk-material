#include <iostream>
#include <string>
using namespace std;


class Person;

class Pet
{
	string 	name;
	Person* owner;

public:

	Pet (string name_, Person* owner_) : name(name_), owner(owner_) {}

	void collar ();

	string getName () { return name; }
};


class Person
{
	string 	name;
	Pet 	pet;

public:

	Person (string name_, string petName_) : name(name_), pet(petName_, this) {}

	void call ()
	{
		cout << pet.getName() << " get over here buddy!" << endl;
	}

	string getName () { return name; }
};


void Pet::collar()
{
	cout << "I'm " << name << " and my owner is " << owner->getName() << endl;
}



int main ()
{
	Person me ("George", "Azor");
	me.call();
	Pet lost ("Rex", &me);
	lost.collar();

}
