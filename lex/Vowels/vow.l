%{
#include <stdio.h>
#include <ctype.h>

int vowels = 0;
int consonants = 0;
%}

%%
exit               {printf("end by exit");return 0;}
[aeiouAEIOU]       { vowels++; }    
[a-zA-Z]           { consonants++; } 
.                  ;
%%

int main() {
    printf("Enter a string: ");
    yylex();
    printf("\nNumber of vowels: %d\n", vowels);
    printf("Number of consonants: %d\n", consonants);
    return 0;
}

int yywrap() {
    return 1;
}
