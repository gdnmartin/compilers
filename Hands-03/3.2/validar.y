%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex(void);
int valid = 1;
%}

/* Tokens */
%token NUM        /* 0 ó 1 */
%token AND OR NOT
%token INVALID

/* Precedencias */
%right NOT
%left AND
%left OR

%start input

%%

/* Entrada: expresion + '\n', y al final salimos */
input:
    expr '\n'    { 
                    if (valid) 
                      printf("Expresión válida\n"); 
                    else 
                      printf("Expresión inválida\n");
                    exit(valid ? 0 : 1);
                 }
  | error '\n'   { 
                    printf("Expresión inválida\n"); 
                    exit(1);
                 }
  ;

/* Gramática BNF pura */
expr:
    expr AND term
  | expr OR  term
  | term
  ;

term:
    NOT factor
  | factor
  ;

factor:
    '(' expr ')'
  | NUM
  ;

/* Capturamos cualquier token inesperado */
%%

void yyerror(const char *s) {
    valid = 0;
}

int main(void) {
    yyparse();  /* Nunca vuelve aquí: input hace exit() */
    return 0;
}
