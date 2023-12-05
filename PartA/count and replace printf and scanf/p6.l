%{
    #include<stdio.h>
    int pc=0,sc=0;
%}
%%
"printf" {pc++;fprintf(yyout,"writef");}
"scanf" {sc++;fprintf(yyout,"readf");}
%%
int yywrap(){return 1;}
int main(int argc, char *argv[]){
    if(argc!=3){
        printf("Enter the files also");
        exit(0);
    }
    yyin=fopen(argv[1], "r");
    yyout=fopen(argv[2], "w");
    yylex();
    printf("The total count of \nPrintf=%d\nscanf=%d",pc,sc);
}