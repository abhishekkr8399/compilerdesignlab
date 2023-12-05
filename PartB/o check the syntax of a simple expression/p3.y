%{
    #include<stdio.h>
    #include<stdlib.h>
%}
%token ID NUMBER NL
%left '+''-'
%left '*''/'
%%
s:expr NL {printf("Valid");exit(0);};
expr: expr '+' expr
    | expr '-' expr
    | expr '*' expr
    | expr '/' expr
    | '(' expr')'
    | '{' expr'}'
    | '[' expr']'
    | ID
    | NUMBER;
%%
int yyerror(){printf("Invalid");exit(0);}
int main(){
    printf("Enter the string: ");
    yyparse();
}
