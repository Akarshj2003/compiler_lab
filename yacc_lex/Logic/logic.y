%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex();

%}

%union {
    int boolval;
}

%token <boolval> BOOL
%token AND OR NOT
%left OR
%left AND
%right NOT
%type <boolval> expr 

%%
input:
    expr     { printf("Result: %s\n", $1 ? "TRUE" : "FALSE"); }
expr:
    BOOL              { $$ = $1;}
    | expr AND expr   { $$ = $1 && $3; }
    | expr OR expr    { $$ = $1 || $3; }
    | NOT expr        { $$ = !$2; }
    | '(' expr ')'    { $$ = $2; }
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    printf("Enter logical expression (use TRUE/FALSE, AND, OR, NOT):\n");
    yyparse();
    return 0;
}
