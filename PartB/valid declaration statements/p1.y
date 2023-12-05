%{
    #include<stdio.h>
    #include<stdlib.h>
%}
%token SP SC CM ID NL INT FLOAT CHAR
%%
s:type SP list SC NL {printf("Valid");exit(0);};
type:INT|CHAR|FLOAT;
list:list SP CM SP ID
    |list CM ID
    |list CM SP ID
    |list SP CM ID
    |ID;
%%
int yyerror(){printf("Invalid");exit(0);}
int main(){
    printf("Enter the string: ");
    yyparse();
}
