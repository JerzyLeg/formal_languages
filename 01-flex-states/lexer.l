
/* TASK:

Print all labels defined with #define directive in "yy.lex.c" file. 
EMAILREGEX ^[a-zA-Z0-9]+([._-][0-9a-zA-Z]+)*@[a-zA-Z0-9]+([.-][0-9a-zA-Z]+)*\.[a-zA-Z]{2,}$
PASSWORDREGEX ^[A-Za-z0-9!@#$%^&*(),.?":{}|<>]{8,15}$

*/ 

%option noyywrap 

%{
	
	#include <stdlib.h>
	#include <iostream>
	bool emailIsValid = false;
	bool passwordIsValid = false;
%}

PASSWORDREGEX ^[A-Za-z0-9]+$
%%
{PASSWORDREGEX} {
	passwordIsValid = true;
	printf("Password is valid\n");
}
. {printf("Passowrd is invalid\n");}
%%
int main() 
{
	yylex();   
    return 0;
}