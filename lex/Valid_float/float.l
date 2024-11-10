%{
#include <stdio.h>
#include <stdlib.h>

int positive_count = 0;
int negative_count = 0;
int invalid_count = 0;
%}

%%
"end"              {return 0; printf("stoped by end");}
-?[0-9]+\.[0-9]+  { 
    
    if (yytext[0] == '-') {
        printf("%s is a negative float\n", yytext);
        negative_count++;
    } else {
        printf("%s is a positive float\n", yytext);
        positive_count++;
    }
}

-?[0-9]+          {
    printf("%s is invalid (integer, not a float)\n", yytext);
    invalid_count++;
}

.+             {
   
    printf("%s is invalid\n", yytext);
    invalid_count++;
}

%%

int main()
{
    printf("Enter values (type 'end' to stop):\n");
    yylex();
    printf("\nSummary:\n");
    printf("Positive floats: %d\n", positive_count);
    printf("Negative floats: %d\n", negative_count);
    printf("Invalid inputs: %d\n", invalid_count);
    return 0;
}

int yywrap()
{
    return 1;
}
