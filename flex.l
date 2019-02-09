%{
	#include<stdio.h>
%}
digit [0-9]
letter [A-Za-z_]
id [a-zA-Z_][a-zA-Z0-9_]*
floats {digit}*\.{digit}+
floating [-+]?{digit}*\.?{digit}+([eE](+|-)?{digit}+)
decimals {digit}+
hexadecimal 0[xX][0-9a-fA-F]+
octal [0-7]+
integers ({decimals}|{hexadecimal}|{octal})
separators [ \t\n]+
%%
("if"|"else"|"main"|"void"|"return"|"static"|"private"|"public"|"typedef"|"struct") {printf("The regular expression of (keywords) is executed, Lexeme is %s\n",yytext);}
{id} {printf("The regular expression of (identifier) is executed, Lexeme is %s\n",yytext);}
{floats} {printf("The regular expression of (floats) is executed, Lexeme is %s\n",yytext);}
{integers} {printf("The regular expression of (integer) is executed, Lexeme is %s\n",yytext);}
{separators} {printf("The regular expression of (separators) is executed, Lexeme is %s\n",yytext);}
("-"|"+"|"*"|"/"|"<="|">="|"<<"|">>"|"="|"<>"|"<"|">") {printf("The regular expression of (operator) is executed, Lexeme is %s\n",yytext);}
("//"|"/*")[^\t\n\r\f\v]*([\n]|"*/") {printf("The regular expression of (comments) is executed, Lexeme is %s\n",yytext);}
. {printf("Unrecognized symbol %s \n",yytext);}
%%
int main( int argc, char **argv )
{
	++argv, --argc;
	if ( argc > 0 ) // A file on input
		yyin = fopen( argv[0], "r" );
	else // Direct keyboard input
		yyin = stdin;
	yylex();
	return 0;
}
