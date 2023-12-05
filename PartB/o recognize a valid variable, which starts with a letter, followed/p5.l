%{
    #include "y.tab.h"
%}
%%
[a-zA-z] {return LETTER;}
[0-9] {return DIGIT;}
[_] {return UND;}
\n {return NL;}
. {return yytext[0];}
%%
int yywrap(){return 1;}