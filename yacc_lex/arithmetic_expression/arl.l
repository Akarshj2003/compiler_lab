%{
#include "y.tab.h"
%}
%%
[0-9]+ { yylval = atoi(yytext); return NUM; }
[A-Za-z] { return id; }
"+"    { return '+'; }
"-"    { return '-'; }
"*"    { return '*'; }
"/"    { return '/'; }
"("    { return '('; }
")"    { return ')'; }
[\t] ;
[\n] {return 0;} 
. { printf("Invalid character: %s\n", yytext); exit(0); }
%%

