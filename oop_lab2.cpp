#include <iostream>
#include <cstring>
#include <climits>
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

class List 
{
	struct Node
	{
		String& data;
		Node*  next;

		// Initializer is crucial due to &
		Node (String& s, Node* n = NULL) : data(s), next(n) {}
	};

	Node* _start;
	int   _size;

public:

	List () : _start(NULL), _size(0) {}

	~List () { while (_size) popAt(0); }

	int size () { return _size; }

	void pushFront (String& s)
	{
		_start = new Node (s, _start);
		_size++;
	}

	bool popAt (int pos)
	{
		if ( pos < 0 || pos >= _size ) return false;

		Node* t = _start;
		if ( pos == 0 )
		{
			_start = _start->next;
		}
		else
		{
			for (int i = 0 ; i < pos - 1 ; i++) t = t->next;
			Node* t2 = t->next;
			t->next = t->next->next;
			t = t2;
		}

		delete t;
		_size--;
		return true;
	}

	String* at (int pos)
	{
		if ( pos < 0 || pos >= _size ) return NULL;

		Node* t = _start;
		for (int i = 0 ; i < pos ; i++) t = t->next;
		return &(t->data);
	}

};


int main ()
{
	String s1("George"), s2("Stathis"), s3("Errikos"), s4("Bill");
	List l;

	l.pushFront(s1);
	l.pushFront(s2);
	l.pushFront(s3);
	l.pushFront(s4);

	cout << l.size() << endl;

	l.at(0)->print();
	cout << endl;
	l.at(1)->print();
	cout << endl;
	l.at(2)->print();
	cout << endl;
	l.at(3)->print();
	cout << endl;

	cout << endl;

	l.popAt(1);

	l.at(1)->print();
	cout << endl;

	cout << l.size() << endl;
}
