%{
    #include<stdio.h>
    #include<stdlib.h>
%}
%token A B NL
%%
expr:s NL {printf("Valid");exit(0);};
s: A s B
  |
  ;
%%
int yyerror(){printf("Invalid");exit(0);}
int main(){
    printf("Enter the string: ");
    yyparse();
}
