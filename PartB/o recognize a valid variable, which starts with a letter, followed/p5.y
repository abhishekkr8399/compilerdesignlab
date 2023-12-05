%{
    #include<stdio.h>
    #include<stdlib.h>
%}
%token LETTER DIGIT UND NL
%%
s:expr NL {printf("Valid");exit(0);};
expr: LETTER alnum;
alnum: LETTER alnum
    |DIGIT alnum
    |UND alnum
    |DIGIT
    |LETTER
    |UND;
%%
int yyerror(){printf("Invalid");exit(0);}
int main(){
    printf("Enter the string: ");
    yyparse();
}
