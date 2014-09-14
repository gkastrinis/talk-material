#include <iostream>
using namespace std;

class Array2D {
	const int y;
	const int x;
	int **array;
public:
	class Row{
		const int* row;
	public:
		Row(const int* r) : row(r) {}
		const int operator[] (int j) const { return row[j]; }
	};


	Array2D(const int _y, const int _x) : y(_y), x(_x) {
		array = new int* [y];
		for(int i=0 ; i < y ; i++) array[i] = new int [x];
		for(int i=0 ; i < y ; i++)
			for(int j=0 ; j < x ; j++)
				array[i][j] = i*x + j;
	}
	~Array2D() {
		for(int i=0 ; i < y ; i++) delete[] array[i];
		delete[] array;
	}
	void print(void) {
		for(int i=0 ; i < y ; i++) {
			for(int j=0 ; j < x ; j++)
				cout << array[i][j] << " ";
			cout << endl;
		}
	}

	const Row operator[] (int i) { return Row(array[i]); }
};



int main(void){
	Array2D a(3,5);
	a.print();
	cout << "\nElement a[1][2]:" << a[1][2] << endl;
}
