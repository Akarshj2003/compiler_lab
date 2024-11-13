%{
    #include<stdio.h>
    #include<stdlib.h>
    void yyerror(char *s){printf("invalid\n");}
%}
%token dig 
%%
out: w out|        
w: e '\n'          {printf("match\n");};
e:
    e '+' e|
    e '-' e|
    e '*' e|
    e '^' e|
    e '=' e|
    dig
;
%%

int main(){
    yyparse();
    return 0;
}