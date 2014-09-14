#include <iostream>
#include <string>
using namespace std;


class Organ
{

	string manufacturer;

public:

	Organ (string manufacturer_) : manufacturer(manufacturer_) {}

	virtual void getDetails () = 0;
};

void Organ::getDetails ()
{
	cout << "Organ manufacturer: " << manufacturer << endl;
}


class ArtificialHeart : public Organ
{
	float condition;

public:

	ArtificialHeart (string manufacturer_) : Organ(manufacturer_), condition(100.0)
	{ cout << "An artificial heart is created" << endl; }
	~ArtificialHeart () { cout << "An artificial heart is destroyed" << endl; }

	void getDamaged (float damage) { condition -= damage; }

	bool isWorking () { return condition > 0.0; }
	
	void getDetails ()
	{
		cout << "Details for artificial heart" << endl;
		Organ::getDetails();
		cout << "Condition: " << condition << endl;
	}
};



class Alive
{
	int age;
	int averageMaxAge;
	int health;

public:

	Alive (int averageMaxAge_, int health_ = 30) : age(0), averageMaxAge(averageMaxAge_), health(health_) {}

	// virtual ~Alive () {}

	int getHealth () { return health; }

	virtual void getOld ()
	{
		age++;
		if ( age <= (averageMaxAge / 2) ) health += 10;
		else health -= 5;
	}

	virtual void getInjured (int damage) { health -= damage; }

	bool hasPassedOut () { return health == 0; }
};


class Human : public Alive
{
	string name;
	int intelligence;

	ArtificialHeart* heart;

public:

	Human (string name_) : Alive(80, 50), name(name_), intelligence(10), heart(NULL) {}

	~Human () { if ( heart != NULL ) delete heart; }

	void getArtificialHeart (string manufacturer) { heart = new ArtificialHeart(manufacturer); }

	void getOld ()
	{
		Alive::getOld();
		intelligence += 10;
		if ( heart != NULL )
		{
			heart->getDamaged(10.0);
			if ( !heart->isWorking() ) getInjured( getHealth() );	
		}
	}

	string getName() { return name; }
};


class Athlet : public Human
{
	int strength;

public:

	Athlet (string name_) : Human(name_), strength(10) {}

	void getOld ()
	{
		Human::getOld();
		strength += 10;
	}

	void specialTraining (int powerUp) { strength += powerUp; cout << "Training" << endl; }

	void getInjured (int damage) { Human::getInjured(damage - (strength * 0.6)); }
};



class Trip
{

public:

	virtual void perform (Human& h, int rounds = 3)
	{
		for (int i = 0 ; i < rounds ; i++)
		{
			cout << "round " << i << endl;
			h.getOld();
		}
		if ( h.getHealth() > 0 ) cout << "Easy Trip finished OK!" << endl;
		else cout << "Easy Trip was difficult!" << endl;
	}
};


class ChallengingTrip : public Trip
{

public:

	virtual void perform (Human& h, int rounds = 7)
	{
		for (int i = 0 ; i < rounds ; i++)
		{
			cout << "round " << i << endl;
			h.getOld();
		}
		if ( h.getHealth() > 0 ) cout << "Challenging Trip finished OK!" << endl;
		else cout << "Challenging Trip was difficult!" << endl;
	}

	virtual void perform (Athlet& a, int rounds = 7)
	{
		for (int i = 0 ; i < rounds ; i++)
		{
			cout << "round " << i << endl;
			a.specialTraining(10);
			a.getInjured(i);
			a.getOld();
		}
		if ( a.getHealth() > 0 ) cout << "Challenging Trip finished OK!" << endl;
		else cout << "Challenging Trip was difficult!" << endl;
	}
};





int main ()
{
	Alive* p;

	p = new Alive(5);
	for (int i = 0 ; i < 8 ; i++)
	{
		p->getOld();
		if ( i % 3 ) p->getInjured(i);
		cout << "(A) Year: " << i;
		if ( p->hasPassedOut() ) { cout << " passed out!" << endl; break; }
		else cout << " OK" << endl; 
	}
	delete p;

	p = new Human("George");
	for (int i = 0 ; i < 8 ; i++)
	{
		p->getOld();
		if ( i == 4 ) ((Human*)p)->getArtificialHeart("myCompany");
		if ( i % 3 ) p->getInjured(i);
		cout << "(H) Year: " << i;
		if ( p->hasPassedOut() ) { cout << " passed out!" << endl; break; }
		else cout << " OK" << endl; 
	}
	delete p;

	p = new Athlet("Rocky");
	for (int i = 0 ; i < 8 ; i++)
	{
		p->getOld();
		if ( i % 3 ) p->getInjured(i);
		cout << "(Ath) Year: " << i;
		if ( p->hasPassedOut() ) { cout << " passed out!" << endl; break; }
		else cout << " OK" << endl; 
	}
	delete p;
	
	Human h("George");
	Athlet a("Hulk");

	cout << "\n\nEasy Trips" << endl;
	Trip* t = new Trip;
	t->perform(h);
	t->perform(a);
	delete t;

	cout << "\n\nChallenging Trips" << endl;
	t = new ChallengingTrip;
	t->perform(h);
	t->perform(a);

	cout << "\n\nChallenging Trips (2)" << endl;
	((ChallengingTrip*)t)->perform(h);
	((ChallengingTrip*)t)->perform(a);
}
