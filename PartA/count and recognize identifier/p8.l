%{
    #include<stdio.h>
    int c=0;
%}
%%
[a-zA-Z][a-zA-Z0-9_]* {c++;ECHO;printf("\n");}
.+ {;}
\n {;}
%%
int yywrap(){return 1;}
int main(int argc, char *argv[]){
    if(argc!=2){
        printf("Enter the files");
        exit(0);
    }
    yyin=fopen(argv[1], "r");
    printf("Valid Identifiers are:\n");
    yylex();
    printf("Total Identifiers: %d",c);
}