%{
    #include "y.tab.h"
%}
%%
"if" {return IF;}
[sS][0-9]* {return S;}
[0-9]+ {return NUMBER;}
[a-zA-Z][a-zA-Z0-9_]* {return ID;}
">"|"<"|"<="|">="|"!="|"==" {return RELOP;}
\n {return NL;}
. {return yytext[0];}
%%
int yywrap(){return 1;}