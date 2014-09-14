template <class T>
class list_ptr {
	private:
		T* ptr;
		list_ptr* next;
		list_ptr* prev;
	public:
		list_ptr(T* data = 0):
			ptr(data), next(this), prev(this) {
		}
		list_ptr(list_ptr& par):
			ptr(par.ptr), next(par.next), prev(&par) {
			par.next = next->prev = this;
		}
		~list_ptr(void) {
			if (next != this || prev != this) {
				next->prev = prev;
				prev->next = next;
			} else if (ptr) delete ptr;
		}
		list_ptr& operator = (list_ptr& par) {
			if (this != &par) {
				if (next != this || prev != this) {
					next->prev = prev;
					prev->next = next;
				} else if (ptr) delete ptr;
				if ((ptr = par.ptr)) {
					next = par.next;
					prev = &par;
					par.next = next->prev = this;
				} else next = prev = this;
			}
			return *this;
		}
		T& operator * (void) {
			return *ptr;
		}
		T* operator -> (void) {
			return ptr;
		}
};


template <class T>
class ref_ptr {
	private:
		struct counter {
			int count;
			T* ptr;
		} *cptr;
	public:
		ref_ptr(T* data = 0):
			cptr(0) {
			if (data) {
				cptr = new counter;
				cptr->count = 1;
				cptr->ptr = data;
			}
		}
		ref_ptr(ref_ptr& par):
			cptr(par.cptr) {
			if (cptr) par.cptr->count++;
		}
		~ref_ptr(void) {
			if (cptr && --cptr->count == 0) {
				delete cptr->ptr;
				delete cptr;
			}
		}
		ref_ptr& operator = (ref_ptr& par) {
			if (this != &par) {
				if (cptr && --cptr->count == 0) {
					delete cptr->ptr;
					delete cptr;
				}
				if ((cptr = par.cptr)) par.cptr->count++;
			}
			return *this;
		}
		T& operator * (void) {
			return *(cptr->ptr);
		}
		T* operator -> (void) {
			return cptr->ptr;
		}
};


#include <iostream>
using namespace std;


class test {
	int i;
	public:
	test(int a = 0):i(a) { cout << "Creating test " << i << endl; };
	~test(void) { cout << "Destroying test " << i << endl; };
	void up(void) { i++; };
	void down(void) { i--; };
	void out(void) { cout << i << endl; };
};


int main(void)
{
	ref_ptr<test> a(new test(0));
	ref_ptr<test> b(new test(1));
	ref_ptr<test> c, d, e;
	c = d = e = a;
	c->up();
	d->up();
	e->up();
	a->out();
	return 0;
}
