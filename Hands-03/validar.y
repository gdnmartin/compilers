%{
#include <stdio.h>
#include <stdlib.h>
%}
%token NUMBER
%left '+' '-'
%left '*' '/'
%right UMINUS
%%
input: expr '\n' { printf("Expresión válida\n"); }
    | error '\n' { yyerror("Expresión inválida"); yyerrok; }
    ;
expr: expr '+' expr
    | expr '-' expr
    | expr '*' expr
    | expr '/' expr
    | '-' expr %prec UMINUS
    | '(' expr ')'
    | NUMBER
    ;
%%
void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
    return 0;
}
int main(void) {
    return yyparse();
}