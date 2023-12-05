%{
    #include "y.tab.h"
%}
%%
"int" {return INT;}
"float" {return FLOAT;}
"char" {return CHAR;}
[ ] {return SP;}
[,] {return CM;}
[;] {return SC;}
[a-zA-Z][a-zA-Z0-9_]* {return ID;}
\n {return NL;}
. {return yytext[0];}
%%
int yywrap(){
    return 1;
}