#ifndef _FRACTION_
#define _FRACTION_

#include <iostream>
#include <exception>


class zero_division : public std::exception {

	public:

	const char* what(void) const throw() {
		return "zero_division";
	}
};

class fraction {

	long long num;
	long long den;

	static inline long long gcd(long long a, long long b) {
		long long t;
		while (b != 0ll) {
			t = b;
			b = a % b;
			a = t;
		}
		return a;
	}

	inline void normalize(void) {
		long long ngcd = gcd(num < 0ll ? -num : num, den);
		num /= ngcd;
		den /= ngcd;
	}

	friend std::ostream& operator << (std::ostream&, const fraction&);
	friend std::istream& operator >> (std::istream&, const fraction&);

	public:

	fraction(long long n = 0ll):
		num(n),
		den(1ll) {}

	fraction(long long n, long long d) {
		if (d < 0ll) {
			num = -n;
			den = -d;
		} else if (d > 0ll) {
			num = n;
			den = d;
		} else
			throw zero_division();
		normalize();
	}

	fraction operator + (const fraction& p) const {
		long long lcm = (den * p.den) / gcd(den, p.den);
		fraction fr(num * (lcm / den) + p.num * (lcm / p.den), lcm);
		fr.normalize();
		return fr;
	}

	fraction& operator += (const fraction& p) {
		long long lcm = (den * p.den) / gcd(den, p.den);
		num = num * (lcm / den) + p.num * (lcm / p.den);
		den = lcm;
		normalize();
		return *this;
	}

	fraction operator - (const fraction& p) const {
		long long lcm = (den * p.den) / gcd(den, p.den);
		fraction fr(num * (lcm / den) - p.num * (lcm / p.den), lcm);
		fr.normalize();
		return fr;
	}

	fraction& operator -= (const fraction& p) {
		long long lcm = (den * p.den) / gcd(den, p.den);
		num = num * (lcm / den) - p.num * (lcm / p.den);
		den = lcm;
		normalize();
		return *this;
	}

	fraction operator * (const fraction& p) const {
		fraction fr(num * p.num, den * p.den);
		fr.normalize();
		return fr;
	}

	fraction& operator *= (const fraction& p) {
		num *= p.num;
		den *= p.den;
		normalize();
		return *this;
	}

	fraction operator / (const fraction& p) const {
		if (p.num < 0) {
			fraction fr(-num * p.den, -den * p.num);
			fr.normalize();
			return fr;
		}
		if (p.num > 0) {
			fraction fr(num * p.den, den * p.num);
			fr.normalize();
			return fr;
		}
		throw zero_division();
	}

	fraction& operator /= (const fraction& p) {
		if (p.num < 0ll) {
			num *= -p.den;
			den *= -p.num;
		} else if (p.num > 0ll) {
			num *= p.den;
			den *= p.num;
		} else
			throw zero_division();
		normalize();
		return *this;
	}

	bool operator == (const fraction& p) const {
		return num == p.num && den == p.den;
	}

	bool operator != (const fraction& p) const {
		return num != p.num || den != p.den;
	}

	bool operator < (const fraction& p) const {
		return num * p.den < p.num * den;
	}

	bool operator > (const fraction& p) const {
		return num * p.den > p.num * den;
	}

	bool operator <= (const fraction& p) const {
		return num * p.den <= p.num * den;
	}

	bool operator >= (const fraction& p) const {
		return num * p.den >= p.num * den;
	}

	long double convert(void) const {
		return ((long double) num) / ((long double) den);
	}
};

std::ostream& operator << (std::ostream& out, const fraction& f) {
	out << f.num;
	if (f.den != 1ll)
		out << '/' << f.den;
	return out;
}

std::istream& operator >> (std::istream& in, const fraction& f) {
	in >> f.num >> '/' >> f.den;
	return in;
}

#endif
