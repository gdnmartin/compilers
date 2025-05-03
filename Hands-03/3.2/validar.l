%{
#include "validar.tab.h"
%}

%%
"AND"       { return AND; }
"OR"        { return OR; }
"NOT"       { return NOT; }
"0"         { return NUM; }
"1"         { return NUM; }
"("         { return '('; }
")"         { return ')'; }

[ \t]+      { /* nada */ }
\n          { return '\n'; }
.           { return INVALID; }
%%

int yywrap(void) { return 1; }
