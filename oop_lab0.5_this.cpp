#include <iostream>
#include <cmath>
using namespace std;

struct Point {
	double x;
	double y;

	void print() {
		cout << "(" << x << ", " << y << ")";
	}

};

// Internally it will look like:
/*
void Point_print(const Point* this) {
	cout << "(" << this->x << ", " << this->y << ")";
}
 */




class Pet;
class Person {
	Pet* myPet;

public:

	void getPet();
};

class Pet {
	Person* owner;

public:

	void setOwner(Person* owner_) {
		owner = owner_;
	}
};


void Person::getPet() {
	/* Why would this be wrong? */
	// Pet p;
	// myPet = &p;

	myPet = new Pet;
	// We *need* this in this example
	myPet->setOwner( this );
}


int main() {
	Point p1, p2;
	p1.print();
	// Internally it will look like:
	// Point_print( &p1 );
	p2.print();
	// Internally it will look like:
	// Point_print( &p2 );

	Person george;
	george.getPet();
}
