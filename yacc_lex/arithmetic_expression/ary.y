%{
#include<stdio.h>
#include<stdlib.h>
void yyerror(char *str)
{
    printf("Error: %s\n", str);
}
%}

%token NUM id
%%
prd: E { printf("Matched an expression\n"); return 0; };
E: E '+' E
 | E '-' E
 | E '*' E
 | E '/' E
 | '(' E ')'
 | NUM
 | id
;
%%
int yywrap()
{
    return 1;
}

int main()
{
    yyparse();
    return 0;
}

