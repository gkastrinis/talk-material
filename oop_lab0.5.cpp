#include <iostream>
#include <cmath>
using namespace std;

struct Point {
	double x;
	double y;

	void print() {
		printInfo();
		cout << "(" << x << ", " << y << ")";
	}

	bool equal(const Point& p) {
		return x == p.x && y == p.y;
	}

	double dist(const Point& p) {
		return sqrt( (x - p.x)*(x - p.x) + (y - p.y)*(y - p.y) );
	}

	// Use constructors instead
	void set(double x_ = 0.0, double y_ = 0.0) {
		x = x_;
		y = y_;
	}

private:
	void printInfo() {
		cout << "" << endl;
	}
};


class Triangle {
	Point a;
	Point b;
	Point c;

public:

	void print() {
		cout << "Triangle: ";
		a.print();
		cout << " , ";
		b.print();
		cout << " , ";
		c.print();
		cout << endl;
	}

	/*const*/Point/*&*/ get(int index) {
		if (index == 0) return a;
		else if (index == 1) return b;
		else return c;
	}

	double area() const {
		return 1; /* ... */
	}

	// Two triangles have the same area
	bool equal(const Triangle& t) {
		return area() == t.area();
	}

	// Two triangles are actually the same (same points)
	bool isTheSame(const Triangle& t) {
		// We have access to *everything* inside *any* Triangle,
		// not just the object we called the method on
		return ( a.equal(t.a) && b.equal(t.b) && c.equal(t.c) );
	}

	// Use constructors instead
	void set(const Point& a_, const Point& b_, const Point& c_) {
		a = a_;
		b = b_;
		c = c_;
	}
};


class Rectangle {
	Point a;
	Point b;

public:

	void print() {
		cout << "Rectangle: ";
		a.print();
		cout << " , ";
		b.print();
		cout << endl;
	}

	/*const*/Point/*&*/ get(int index) {
		if (index == 0) return a;
		else return b;
	}

	double area() const {
		return 1; /* ... */
	}

	bool equal(const Rectangle& r) {
		return area() == r.area();
	}

	// Use constructors instead
	void set(const Point& a_, const Point& b_) {
		a = a_;
		b = b_;
	}
};



int main() {
	Point p1, p2;
	p1.set(1.2, 3.4);
	p2.set();
	p1.print();
	cout << endl;
	p2.print();
	// p2.printInfo();
	cout << endl;
	cout << p1.dist(p2) << endl;

	Point a, b, c, d, e, f;
	a.set();
	b.set(1, 2);
	c.set(3, 4);
	d.set();
	e.set(5, 6);
	f.set(7, 8);
	Triangle t1, t2;
	t1.set(a, b, c);
	t2.set(d, e, f);

	cout << (t1.equal(t2) ? "" : "NOT ") << "Equal" << endl;

	cout << (t1.isTheSame(t2) ? "" : "NOT ") << "The same" << endl;
}
