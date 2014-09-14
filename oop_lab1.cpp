#include <iostream>
#include <climits>
#include <cstring>
using namespace std;

class String
{
	char* buffer_;
	int   capacity_;
	int   size_;

	void allocate () { buffer_ = new char[capacity_ + 1]; }
	void from_c_string (const char* c_str)
	{
		allocate();
		for (int i = 0 ; i < capacity_ ; i++, size_ = i) { char c = buffer_[i] = c_str[i]; if (!c) break; }
		buffer_[size_] = '\0';
	}

public:

	String (int capacity__ = 256) : capacity_(capacity__), size_(0) { allocate (); buffer_[size_] = '\0';}

	String (const String& str) : capacity_(str.capacity_), size_(str.size_)
	{
		allocate();
		for (int i = 0 ; i <= size_ ; i++) buffer_[i] = str.buffer_[i];
	}

	String (const String& str, int start, int length) : capacity_(str.capacity_)
	{
		allocate();
		for (int i = start ; i < length && i <= str.size_ ; i++, size_ = i - start)
		{ char c = buffer_[i - start] = str.buffer_[i]; if (!c) break; }
		buffer_[size_] = '\0';
	}

	String (const char* c_str, int c_size) : capacity_(c_size) { from_c_string(c_str); }
	String (const char* c_str) : capacity_(strlen(c_str)) { from_c_string(c_str); }

	~String() { delete[] buffer_; }


	int size () const { return size_; }
	int capacity () const { return capacity_; }
	char at (int pos) const { return pos >= 0 && pos < size_ ? buffer_[pos] : '\0'; }
	bool at (int pos, char c) { return pos >= 0 && pos < size_ ? buffer_[pos] = c, true : false; }
	bool add (char c) { return size_ < capacity_ ? size_++, buffer_[size_] = c, buffer_[size_+1] = '\0', true : false; }

	String substr (int start = 0, int length = INT_MAX) const { return String (*this, start, length); }

	int find (const String& str, int start = 0) const
	{
		for (int i = start ; i < size_ ; i++)
		{
			if ( buffer_[i] != str.buffer_[0] ) continue;
			int j;
			for (j = 1 ; j < str.size_ && i + j < size_ ; j++)
				if ( buffer_[i+j] != str.buffer_[j] ) break;
			if ( j == str.size_ ) return i; 
		}
		return -1;
	}

	void print () { cout << buffer_; }
};


class Person
{
	String name_;

public:

	// Initializer list is a must here
	Person (String& /* can't do p2("george-II") cause of "&" */ name__) : name_(name__) { /*name_ = name__;*/ }

	// Person& can be promoted to const Person&
	Person (const Person& p) : name_(p.name_) { cout << "Copy constructor" << endl; }

	// But not the opposite
	//Person (Person& p) : name_(p.name_) { cout << "B" << endl; }

	String name () { return name_; }
};


int main ()
{
	String s("george");
	/* const */ Person p1(s);
	//Person p2("george-II");
	Person p3(p1);

	/*
	// Uncomment if Person constuctor has not initializer list to check results
	// Also at the end of program "double free" error 
	s.at(0, 'G');
	Person p4(s);

	cout << "p4.name (after): " ; p4.name().print(); cout << endl;
	// Name changed!
	cout << "p1.name (after): " ; p1.name().print(); cout << endl;
	*/
	

	String s1("There are two needles in this haystack with needles.");
	String s2("needle");
	cout << "\"needle\" found at position: " << s1.find(s2, 0) << endl;
}
