#include <iostream>
using namespace std;


template <class T>
class Array
{
	T** data;
	unsigned int size_var;

	public:

	Array(unsigned int s, const T& d): size_var(s)
	{
		data = new T* [size_var];
		for (unsigned int i = 0 ; i < size_var ; i++)
			data[i] = new T(d);
	}
	
	Array(const Array& a): size_var(a.size_var)
	{
		data = new T* [size_var];
		for (unsigned int i = 0 ; i < size_var ; i++)
			data[i] = new T(*(a.data[i]));
	}
	
	~Array(void)
	{
		for (unsigned int i = 0 ; i < size_var ; i++)
			delete data[i];
		delete[] data;
	}

	unsigned int size(void) const
	{
		return size_var;
	}

	T& operator [] (unsigned int p)
	{
		return *(data[p]);
	}

	const T& operator [] (unsigned int p) const
	{
		return *(data[p]);
	}
};


int main(void)
{
	Array <unsigned int> a(10, 0);
	for (unsigned int i = 0 ; i < a.size() ; i++)
		a[i] = i;
	Array <unsigned int> b(a);
	for (unsigned int i = 0 ; i < b.size() ; i++)
		cout << b[i] << ' ';
	cout << endl;
	return 0;
}
