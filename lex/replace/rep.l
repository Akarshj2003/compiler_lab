%{
# include<stdio.h>
# include<string.h>
%}
%option noyywrap
%%
\"[^\n]*\"     {int len = yyleng-2;printf("\"%d\"",len);}
.       {putchar(yytext[0]);}
'\n'      { putchar("\n"); } 
end     {return 0;printf("stoped by end");}
%%

void main(){
    yylex();
}