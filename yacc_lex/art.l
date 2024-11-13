%{
    #include"y.tab.h"
%}

%%
[a-zA-z][0-9A-Za_z]*   {return dig;}
[0-9]+      {return dig;}
"+"         {return '+';}
"-"         {return '-';}
"*"         {return '*';}
"/"         {return '/';}
"="         {return '=';}
"^"         {return '^';}
\n          {return '\n';}
.           {printf("invalid char%s",yytext);exit(0);}
%%
int yywrap(){return 1;}