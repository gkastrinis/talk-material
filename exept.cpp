#include <exception>
#include <iostream>
using namespace std;

void terminator() {
cout << "fsdfsfd" << endl;
exit(0);
}

void (*old)() = set_terminate(terminator);

class Botch {
public:
class Fruit {};
void f() { cout <<"Botch"<< endl;
throw Fruit();
}
~Botch() { throw 'c'; }
};

int main() {
try {
Botch b;
b.f();
} catch(...) {
cout << "inside"<< endl;
}}
