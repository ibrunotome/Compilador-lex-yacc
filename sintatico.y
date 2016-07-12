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

%% /∗ beginning of rules section ∗/

PROG: programa id pvirg DECLS C-COMP
	;	
DECLS: /* empty*/  
	 | variaveis LIST-DECLS
	 ;
LIST-DECLS: DECL-TIPO D
		  ;
D: /* empty*/
 | LIST-DECLS
 ;
DECL-TIPO: LIST-ID dpontos TIPO pvirg
		 ;
LIST-ID: id E
       ;
E: /* empty*/ 
 | virg LIST-ID
 ;
TIPO: inteiro 
    | real 
    | logico 
    | caracter
    ;
C-COMP: abrech LISTA-COMANDOS fechach
	  ;	
LISTA-COMANDOS: COMANDOS G
			  ;
G: /* empty*/ 
 | LISTA-COMANDOS
COMANDOS: IF 
		| WHILE 
		| READ 
		| WRITE 
		| ATRIB
		;
IF: se abrepar EXPR fechapar C-COMP H
  ;
H: /* empty*/ 
 | senao C-COMP
 ;
WHILE:  enquanto abrepar EXPR fechapar C-COMP
	 ;
READ: leia abrepar LIST-ID fechapar pvirg
    ;
ATRIB: id atrib EXPR pvirg
	 ;
WRITE: escreva abrepar LIST-W fechapar pvirg
     ;
LIST-W: ELEM-W L
      ;
L: /* empty*/
 | virg LIST-W
 ;
ELEM-W: EXPR | cadeia
	  ;
EXPR: SIMPLES P
    ;
P: /* empty*/
 | oprel SIMPLES
 ;
SIMPLES: TERMO R
	   ;
R: /* empty*/ 
 | opad SIMPLES
 ;
TERMO: FAT S
S: /* empty*/ 
 | opmul TERMO
 ;
FAT: id
   | cte
   | abrepar EXPR fechapar
   | verdadeiro
   | falso
   | opneg FAT
   ;
%%

#include "lex.yy.c"
int yyerror( char *s)
{
    fprintf(stderr, "%s\n", s);
    return 0;
} 
int main(int argc, char *argv[])
{
    yyin=fopen(argv[1], "r");
    if(!yyin)
    {
        printf("O arquivo %s nao existe \n", argv[1]);
        exit(1);
    }     
    yyparse();
    return 0; 
}    
