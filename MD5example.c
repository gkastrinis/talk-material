#include <stdio.h>
#include <string.h>
#include "MD5.h"

//paradeigma paragogis MD5 hashes
//online applet at: http://www.md5.cz/

int main( void )
{
	MD5_CTX context;
	unsigned int message1_digest[4],message2_digest[4],concatenation_digest[4];
	char message1[] = "asdf";
	char message2[] = "qwerty";
	//Ipologismos tis sinopsis (digest) tou minimatos 1
	MD5Init( &context );
	MD5Update( &context , message1 , strlen( message1 ) );
	MD5Final( message1_digest , &context );
	//Ektiposi tis sinopsis tou minimatos 1
	printf("MD5(%s)=",message1);
	MD5Print( message1_digest );
	printf("\n");
	//Ipologismos tis sinopsis (digest) tou minimatos 2
	MD5Init( &context );
	MD5Update( &context , message2 , strlen( message2 ) );
	MD5Final( message2_digest , &context );
	//Ektiposi tis sinopsis tou minimatos 1
	printf("MD5(%s)=",message2);
	MD5Print( message2_digest );
	printf("\n");
	//Ipologismos tis sinopsis (digest) tis parathesis ton
	//sinopsewn ton minimatwn 1 kai 2, diladi:
	//			MD5( message1_digest || message2_digest )
	MD5Init( &context );
	MD5Update( &context , (char *)message1_digest , 4 * sizeof( int ) );
	MD5Update( &context , (char *)message2_digest , 4 * sizeof( int ) );
	MD5Final( concatenation_digest , &context );
	//Ektiposi tis sinopsis tis parathesis ton sinopsewn
	printf("MD5(");
	MD5Print( message1_digest );
	printf("||");
	MD5Print( message2_digest );
	printf(")=");
	MD5Print( concatenation_digest );
	printf("\n");
	return 0;
}
