%{
    #include<stdio.h>
    #include<stdlib.h>
%}
%token A B NL
%%
expr:A A A A A A A A A A s B NL {printf("Valid");exit(0);};
s: s A
  |
  ;
%%
int yyerror(){printf("Invalid");exit(0);}
int main(){
    printf("Enter the string: ");
    yyparse();
}
