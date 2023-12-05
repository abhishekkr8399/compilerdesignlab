%{
    #include<stdio.h>
    #include<string.h>
    int noprt=0,nopnd=0,valid=1,top=-1,i=0,j=0;
    char oprt[10][10],opnd[10][10],a[100];
%}
%%
"(" {top++;a[top]='(';}
"{" {top++;a[top]='{';}
"[" {top++;a[top]='[';}
")" {if(a[top]!='('){valid=0;return 0;}else top--;}
"}" {if(a[top]!='{'){valid=0;return 0;}else top--;}
"]" {if(a[top]!='['){valid=0;return 0;}else top--;}
"+"|"-"|"*"|"/" {noprt++;strcpy(oprt[i],yytext);i++;}
[a-zA-Z][a-zA-z0-9_]* {nopnd++;strcpy(opnd[j],yytext);j++;}
%%
int yywrap(){return 1;}
int main(){
    int k;
    printf("Enter the Expression: ");
    yylex();
    if(valid==1 && (nopnd-noprt)==1 && top==-1){
        printf("Valid Expression\n");
        printf("Total no of \noperators: %d\noperands: %d\n",noprt,nopnd);
        printf("The operators are:\n");
        for(k=0;k<i;k++){
            printf("%s\n",oprt[k]);
        }
        printf("The operands are:\n");
        for(k=0;k<j;k++){
            printf("%s\n",opnd[k]);
        }
    }else{printf("Invalid Expression");}
}