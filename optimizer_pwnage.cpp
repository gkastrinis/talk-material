#include <iostream>
using namespace std;

class Time {
      int hours;
      int mins;
public:
      Time() { hours = 0; mins = 0; cout << "I just created a time at "<< (void*)this << endl; }
      Time(const Time& t) { hours = t.hours; mins = t.mins; cout << "copy " << (void*)&t << " to "<< (void*)this << endl; }
      ~Time() {cout << "I just destroyed a time at " << (void*)this << endl;};
      Time add(Time);
};

Time Time::add(Time t) {
    Time result;
    result.hours = 0;
    result.mins = mins + t.mins;

    if (result.mins > 60)
       {
           result.mins -= 60;
           result.hours += 1;
       }

    result.hours += hours + t.hours;

    cout << "param is at " << (void*)&t << endl;
    cout << "result is at " << (void*)&result << endl;
    return result;
}


int main(void) {
    Time t;
    Time tt;
	Time ttt = t.add(tt);
    cout << "t is at " << (void*)&t << endl;
    cout << "tt is at " << (void*)&tt << endl;
    cout << "ttt is at " << (void*)&ttt << endl;
	return 0;
}
