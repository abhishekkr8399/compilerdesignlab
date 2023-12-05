%{
    #include<stdio.h>
    int c=0;
%}
%s COMMENT
%%
"//".* {c++;}
"/*" {BEGIN COMMENT;}
<COMMENT>"*/" {BEGIN 0; c++;}
<COMMENT>\n {c++;}
<COMMENT>. {;}
%%
int yywrap(){return 1;}
int main(int argc, char *argv[]){
    if(argc!=3){
        printf("Enter input files");
        exit(0);
    }
    yyin=fopen(argv[1], "r");
    yyout=fopen(argv[2], "w");
    yylex();
    printf("Total no of comments: %d\n", c);
}