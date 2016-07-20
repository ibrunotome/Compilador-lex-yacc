%token MENOR_Q
%token MENOR_I
%token IGUAL
%token DIFERENTE
%token MAIOR_Q
%token MAIOR_I
%token SE
%token SENAO
%token ID
%token CTE
%token MAIS
%token MENOS
%token VEZES
%token DIVIDIR
%token ATRIB
%token PVIRG
%token DPONTOS
%token VIRG
%token ABRECH
%token ABREPAR
%token FECHACH
%token FECHAPAR
%token PROGRAMA
%token VARIAVEIS
%token INTEIRO
%token REAL
%token LOGICO
%token CARACTER
%token ESCREVA
%token LEIA
%token FALSO
%token VERDADEIRO
%token ENQUANTO
%token OPREL
%token OPAD
%token OPMUL
%token OPNEG
%token CADEIA
%token ERRO

%% /* beginning of rules section */

prog: PROGRAMA ID PVIRG decls ccomp
	;
  
decls: /* empty*/  
	 | VARIAVEIS listdecls
	 ;

listdecls: decltipo d
		  ;

d: /* empty*/
 | listdecls
 ;

decltipo: listid DPONTOS tipo PVIRG
		 ;

listid: ID e
       ;

e: /* empty*/ 
 | VIRG listid
 ;

tipo: INTEIRO 
    | REAL 
    | LOGICO 
    | CARACTER
    ;

ccomp: ABRECH listacomandos FECHACH
	  ;	

listacomandos: comandos g
			  ;

g: /* empty*/ 
 | listacomandos
 ;

comandos: if 
		| while 
		| read 
		| write 
		| atrib
		;

if: SE ABREPAR expr FECHAPAR ccomp h
  ;

h: /* empty*/ 
 | SENAO ccomp
 ;

while: ENQUANTO ABREPAR expr FECHAPAR ccomp
	 ;

read: LEIA ABREPAR listid FECHAPAR PVIRG
    ;

atrib: ID ATRIB expr PVIRG
	 ;

write: ESCREVA ABREPAR listw FECHAPAR PVIRG
     ;

listw: elemw l
      ;

l: /* empty*/
 | VIRG listw
 ;

elemw: expr | CADEIA
	  ;

expr: simples p
    ;

p: /* empty*/
 | OPREL simples
 ;

simples: termo r
	   ;

r: /* empty*/ 
 | OPAD simples
 ;

termo: fat s
      ;

s: /* empty*/ 
 | OPMUL termo
 ;

fat: ID
   | CTE
   | ABREPAR expr FECHAPAR
   | VERDADEIRO
   | FALSO
   | OPNEG fat
   ;
%%

#include <stdio.h>
#include <stdlib.h>
#include "lex.yy.c"

/* extern yyin;
 extern yytext; */

int yyerror(char *s) {
    fprintf(stderr, "%s, linha: %d, token: %d\n", s, countLinhas, yylval);
    return 0;
} 

int main(int argc, char *argv[]) {
    yyin = fopen(argv[1], "r");
    if (!yyin) {
        printf("O arquivo %s nao existe \n", argv[1]);
        exit(1);
    }     
    yyparse();
    return 0; 
}    
