#include <iostream>
#include <string>
using namespace std;

class Machinery
{
	string _name;
	int    _weight;

public:

	Machinery (string s, int w) : _name(s), _weight(w) {}
	virtual ~Machinery () { cout << "Machinery::~Machinery" << endl; }

	int weight () { return _weight; }

	virtual void operate (int hours = 1) = 0;
};


class Vehicle : public Machinery
{
public:
	Vehicle (string s, int w) : Machinery(s, w) {}

	void operate (int hours = 3) { cout << "Vehicle operating for " << hours << " hour(s)" << endl; }
};


class Computer : public Machinery
{
public:
	Computer (string s, int w) : Machinery(s, w) {}
	~Computer () { cout << "Computer::~Computer" << endl; }

	void operate (int hours = 5) { cout << "Computer operating for " << hours << " hour(s)" << endl; }
};

//////////////////////////////////////////////////

class Alive
{
	int _age;
	int _health;

public:

	Alive (int h) : _age(0), _health(h) {}

	virtual ~Alive() {}

	int age () { return _age; }
	int health () { return _health; }

	bool dead () { return _health < 0; }

	void eat () { cout << "Mmm" << endl; }

	virtual bool getOld ()
	{
		cout << "Alive::getOld" << endl;
		if ( dead() ) return false;
		_age++; _health -= 5;
		return true;
	}
};


class Person : public Alive
{
	string _name;
	int    _height;

	Computer* pc;
	// Test in combination with virtual in ~Machinery() and ~Alive()
	//Machinery* pc;

public:

	Person (string s) : Alive(200), _name(s), _height(50), pc(NULL) {}

	virtual ~Person () { if ( pc ) delete pc; }

	string& name () { return _name; }
	int height () { return _height; }

	void buyPC () { pc = new Computer("my computer", 5); }

	void eat () { cout << "Eating my food" << endl; }

	bool getOld ()
	{
		cout << "Person::getOld" << endl;
		if ( !Alive::getOld() ) return false;
		if ( age() > 50 )
			_height--;
		else
			_height++;
		return true;
	}

	virtual void workOn (Machinery* i)
	{
		cout << "Generic operation on machinery" << endl;
		i->operate();
	}

	virtual void workOn (Vehicle* v)
	{
		cout << "Generic operation on vehicle" << endl;
		v->operate();
	}
};


class Technician : public Person
{
	int _money;

public:

	Technician (string s) : Person(s), _money(0) {}

	int money () { return _money; }

	bool getOld ()
	{
		cout << "Technician::getOld" << endl;
		if ( !Person::getOld() ) return false;
		_money++;
		return true;
	}

	void workOn (Machinery* i)
	{
		cout << "Special operation on machinery" << endl;
		i->operate();
	}

	void workOn (Computer* c)
	{
		cout << "Special operation on computer" << endl;
		c->operate();
	}
};


int main ()
{
	Alive a(100);
	a.getOld();

	Person p("george");
	p.getOld();

	Technician t("mastro-giorgos");
	t.getOld();

	Alive* aPtr = &a;
	aPtr->getOld();
	aPtr = &p;
	aPtr->getOld();
	aPtr = &t;
	aPtr->getOld();

	Alive& aRef = p;
	aRef.getOld();

	aPtr->eat();
	t.eat();

	aPtr = new Person("Jamez");
	((Person*)aPtr)->buyPC();
	delete aPtr;

	Vehicle c("car", 1000);
	Computer pc("pc", 5);

	Machinery* mP = &c;

	Person* pPtr = &p;
	pPtr->workOn(mP);
	pPtr->workOn(&c);
	pPtr->workOn(&pc);

	pPtr = &t;
	pPtr->workOn(mP);
	pPtr->workOn(&c);
	pPtr->workOn(&pc);

	Technician* tPtr = &t;
	tPtr->workOn(mP);
	tPtr->workOn(&c);
	tPtr->workOn(&pc);
}