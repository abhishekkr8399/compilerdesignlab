%{
    #include<stdio.h>
    int c=0,w=0,s=0,l=0;
%}
%%
[^ \t\n,\.:]+ {w++;c=c+yyleng;}
[ ] {s++;}
[\n] {l++;}
%%
int yywrap(){return 1;}
int main(int argc, char *argv[]){
    if(argc!=2){
        printf("Enter files");
        exit(0);
    }
    yyin=fopen(argv[1], "r");
    yylex();
    printf("Total number of\nChar=%d\nWord=%d\nSpace=%d\nLines=%d",c,w,s,l);
}