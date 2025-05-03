%{
#include "validar.tab.h"
%}

%%

[0-9]+      { yylval = atoi(yytext); return NUM; }
"AND"       { return AND; }
"OR"        { return OR; }
"NOT"       { return NOT; }

[ \t]       ; // Ignorar espacios y tabulaciones

\n          { return '\n'; }

"+"         { return '+'; }
"-"         { return '-'; }
"*"         { return '*'; }
"/"         { return '/'; }
"("         { return '('; }
")"         { return ')'; }

.           { return yytext[0]; }

%%

int yywrap(void) {
    return 1;
}
