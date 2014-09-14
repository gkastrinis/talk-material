#include <stdio.h>
#define FIBNUMBER 9

main ()
{
	int i, fib0 = 0, fib1 = 1;

	if ( FIBNUMBER == 0 ) { printf("0\n"); return; }
	else if ( FIBNUMBER == 1 ) { printf("1\n"); return; }

	for ( i = 2 ; i <= FIBNUMBER ; i++)
	{
		int t = fib1;
		fib1 = fib1 + fib0;
		fib0 = t;
	}
	printf ("%d\n", fib1);
}
