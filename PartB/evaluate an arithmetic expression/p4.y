%{
    #include<stdio.h>
    #include<stdlib.h>
%}
%token NUMBER NL
%left '+''-'
%left '*''/'
%%
s:expr NL {printf("Value=%d",$1);exit(0);};
expr: expr '+' expr {$$=$1+$3;}
    | expr '-' expr {$$=$1-$3;}
    | expr '*' expr {$$=$1*$3;}
    | expr '/' expr {if ($3==0){printf("Can't divide by zero");exit(0);}else $$=$1/$3;}
    | '(' expr')' {$$=$2;}
    | '{' expr'}' {$$=$2;}
    | '[' expr']' {$$=$2;}
    |NUMBER {$$=$1;};
%%
int yyerror(){printf("Invalid");exit(0);}
int main(){
    printf("Enter the string: ");
    yyparse();
}
