%{
# include<stdio.h>
%}

%%
aba     {printf("ABA");}
.       {putchar(yytext[0]);}
%%
yywrap(){
    return 1;
}
void main(){
    yylex();
}