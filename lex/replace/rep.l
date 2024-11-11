%{
#include <stdio.h>
#include <string.h>
FILE *yyin, *yyout;
%}
%option noyywrap

%%

\"[^\n]*\"     {int len = yyleng - 2; fprintf(yyout, "\"%d\"", len);} 
.              {fputc(yytext[0], yyout);}                           
\n             {fputc('\n', yyout);}                                
end            {printf("Stopped by 'end'"); return 0;}              

%%

int main() {
    yyin = fopen("text.txt", "r");      
    if (!yyin) {
        perror("Failed to open input file");
        return 1;
    }
    
    yyout = fopen("out.txt", "w");      
    if (!yyout) {
        perror("Failed to open output file");
        fclose(yyin);
        return 1;
    }

    yylex();                           
    fclose(yyin);                       
    fclose(yyout);                      

    return 0;
}
