%{
    #include<stdio.h>
    int pi=0,ni=0,pf=0,nf=0;
%}
%%
[+]?[0-9]+ {pi++;}
[-][0-9]+ {ni++;}
[+]?[0-9]*\.[0-9]+ {pf++;}
[-][0-9]*\.[0-9]+ {nf++;}
. {;}
\n {;}
%%
int yywrap(){return 1;}
int main(int argc, char *argv[]){
    if(argc!=2){
        printf("Enter the files");
        exit(0);
    }
    yyin=fopen(argv[1], "r");
    yylex();
    printf("The total number of\nPositive Integer=%d\nNegative Integer=%d\nPositive Fraction=%d\nNegative Fraction=%d",pi,ni,pf,nf);
}