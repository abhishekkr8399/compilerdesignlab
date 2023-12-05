%{
#include<stdio.h>
int pc=0, sc=0;
int flag_printf = 0, flag_scanf = 0;
%}
%%
\n {flag_printf = 0; flag_scanf = 0; ECHO;}
"printf" {if(flag_printf == 0) {fprintf(yyout,"writef"); pc++; flag_printf = 1;} else ECHO;}
"scanf" {if(flag_scanf == 0) {fprintf(yyout,"readf"); sc++; flag_scanf = 1;} else ECHO;}
. {ECHO;}
%%
int yywrap()
{
return 1;
}
int main() 
{
yyin = fopen("in.txt", "r");
yyout = fopen("out.txt", "w");
yylex();
printf("No of writef statements = %d\nNo of readf statements=%d\n", pc, sc);
}
