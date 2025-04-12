%{
#include <stdio.h>
int yywrap() { return 1; }
%}

%%
"int"|"return" { printf("Palabra clave: %s\n", yytext); }
[a-zA-Z_][a-zA-Z0-9_]* { printf("Identificador: %s\n", yytext); }
[0-9]+ { printf("Número: %s\n", yytext); }
[;] { printf("Punto y coma: %s\n", yytext); }
[ \t\n] ;
. { printf("Carácter desconocido: %s\n", yytext); }
%%

int main() {
    yylex();
    return 0;
}