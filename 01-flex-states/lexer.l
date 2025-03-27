/* TASK:

Print all labels defined with #define directive in "yy.lex.c" file. 
EMAILREGEX ^[a-zA-Z0-9]+([._-][0-9a-zA-Z]+)*@[a-zA-Z0-9]+([.-][0-9a-zA-Z]+)*\.[a-zA-Z]{2,}$
NUMBERSREGEX    [0-9]+
{NUMBERSREGEX} {
	numbers++;
	printf("Integer detected: %s. Counter of detected integers: %d\n", yytext, numbers);
}


*/ 

%option noyywrap

%{
    #include <stdlib.h>
    #include <stdio.h>

%}

KEYWORD  "int"|"float"
NAME       [a-zA-Z_][a-zA-Z0-9_]*
FLOAT    [0-9]+(\.[0-9]+)?
INT      [0-9]+
OP       [+\-*/]
REL_OP   "<="|">="|"="|"<"|">"
LPAREN   "("
RPAREN   ")"
LBRACK   "["
RBRACK   "]"
LBRACE   "{"
RBRACE   "}"
SEMICOLON ";"

%%

{KEYWORD} {
    printf("Type: %s\n", yytext);
}

{NAME} {
    printf("Variable name: %s\n", yytext);
}

{INT} {
    printf("Integer value: %s\n", yytext);
}

{FLOAT} {
    printf("Floating-point value: %s\n", yytext);
}

{OP} {
    printf("Operator: %s\n", yytext);
}

{REL_OP} {
    printf("Relational operator: %s\n", yytext);
}

{LPAREN} { printf("Left parenthesis: %s\n", yytext); }
{RPAREN} { printf("Right parenthesis: %s\n", yytext); }
{LBRACK} { printf("Left square bracket: %s\n", yytext); }
{RBRACK} { printf("Right square bracket: %s\n", yytext); }
{LBRACE} { printf("Left curly brace: %s\n", yytext); }
{RBRACE} { printf("Right curly brace: %s\n", yytext); }

{SEMICOLON} {
    printf("Semicolon detected\n");
}

[ \t\n]    ; // Ignore whitespace

. {
    printf("Unknown character: %s\n", yytext);
}

%%

int main() {
    printf("Enter a statement:\n");
    yylex();
    return 0;
}