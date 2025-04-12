%{
#include <stdio.h>
int palabras_clave = 0, identificadores = 0, numeros = 0, operadores = 0, delimitadores = 0;
int yywrap() { return 1; }
%}

%%
"int"|"return" { palabras_clave++; }
[a-zA-Z_][a-zA-Z0-9_]* { identificadores++; }
[0-9]+ { numeros++; }
[=+\-*/] { operadores++; }
[;{}(),] { delimitadores++; }
[ \t\n] ;
. ;
%%

int main() {
    yylex();
    printf("Palabras clave: %d\n", palabras_clave);
    printf("Identificadores: %d\n", identificadores);
    printf("Números: %d\n", numeros);
    printf("Operadores: %d\n", operadores);
    printf("Delimitadores: %d\n", delimitadores);
    return 0;
}