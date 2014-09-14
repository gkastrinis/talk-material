#include <stdio.h>

main ()
{
	int c, flag = 0;
	while ( (c = getchar()) != EOF )
	{
		if ( (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') )
		{
			putchar(c);
			flag = 0;
		}
		else if ( !flag )
		{
			putchar('\n');
			flag = 1;
		}
	}
}
