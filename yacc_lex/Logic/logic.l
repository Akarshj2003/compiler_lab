%{
#include "y.tab.h"
%}

%%

"AND"           { return AND; }
"OR"            { return OR; }
"NOT"           { return NOT; }
"("             { return '('; }
")"             { return ')'; }
"TRUE"          { yylval.boolval = 1; return BOOL; }
"FALSE"         { yylval.boolval = 0; return BOOL; }
[ \t]+          ;
\n              {return 0;}
.               { printf("Unexpected character: %s\n", yytext); }

%%

int yywrap() { return 1; }
