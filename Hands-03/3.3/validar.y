%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
void yyerror(const char *s);
%}

%token NUM BOOL AND OR NOT
%left '+' '-'
%left '*' '/'
%left AND OR
%right NOT

%%

input:
    expr '\n'   { printf("Expresión válida\n"); }
  | error '\n'  { printf("Expresión inválida\n"); yyerrok; }
  ;

expr:
    expr '+' expr
  | expr '-' expr
  | expr '*' expr
  | expr '/' expr
  | expr AND expr
  | expr OR expr
  | NOT expr
  | '(' expr ')'
  | NUM
  | BOOL
  ;

%%

void yyerror(const char *s) {
    // printf("Error: %s\n", s);
}

int main(void) {
    yyparse();
    return 0;
}
