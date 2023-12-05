%{
#include<stdio.h>
int pc=0, sc=0;
%}
%%
"printf" {printf("writef"); pc++;}
"scanf" {printf("readf"); sc++;}
%%
int yywrap()
{
return 1;
}
int main() 
{
yylex();
printf("No of writef statements = %d\n No of readf statements=%d\n", pc, sc);
}
