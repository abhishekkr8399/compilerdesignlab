%{
    #include<stdio.h>
    #include<stdlib.h>
    int c=0;
%}
%token IF RELOP S ID NUMBER NL
%%
s:if_stmt NL {printf("Total levels of nesting=%d",c);exit(0);};
if_stmt: IF '('cond')''{'if_stmt'}' {c++;}
        |S;
cond:x RELOP x;
x:NUMBER|ID;
%%
int yyerror(){printf("Invalid");exit(0);}
int main(){
    printf("Enter the string: ");
    yyparse();
}
