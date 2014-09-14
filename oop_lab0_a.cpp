#include <iostream>
#include <ctime>
using namespace std;

namespace Math {
	const double minCharge = 1.602E-19;
	inline double rate(double a, double b) {
		return (b - a) / b;
	}
}

namespace Bank {
	const int minCharge = 3;
	const double rate = 0.1;
}


int main() {
	cout << Math::minCharge << endl;
	cout << Bank::minCharge << endl;

	cout << Math::rate(10, 15) << endl;
	cout << Bank::rate << endl;

	using namespace Bank;
	cout << rate << endl;

	const char* rate = "good";
	cout << rate << endl;
	cout << Bank::rate << endl;

	int time = 0;
	cout << time << endl;
	cout << ::time(NULL) << endl;	
}
