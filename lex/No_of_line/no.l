%{
#include <stdio.h>

int line_count = 0;
int word_count = 0;
int char_count = 0;
%}

%%
end           {printf("Program terminated by 'end'\n"); return 0;}
\n              { line_count++; char_count++; }
[ \t]           { char_count++; }
[^\n \t]+       { word_count++; char_count += yyleng; }

%%
int yywrap()
{
    return 1;
}
int main()
{
    yylex();
    printf("Lines: %d\n", line_count);
    printf("Words: %d\n", word_count);
    printf("Characters: %d\n", char_count);
    return 0;
}


