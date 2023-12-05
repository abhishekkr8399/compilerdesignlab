%{
    #include<stdio.h>
    int v=0,c=0;
%}
%%
[aeiouAEIOU] {v++;}
[a-zA-Z] {c++;}
. {;}
%%
int yywrap(){return 1;}
int main(){
    printf("Enter the String: ");
    yylex();
    printf("The total no of \nvowels=%d\nconsonants=%d",v,c);
}