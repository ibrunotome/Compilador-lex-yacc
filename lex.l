%{
	enum {
		MENOR_Q = 1,
		MENOR_I,
		IGUAL,
		DIFERENTE,
		MAIOR_Q,
		MAIOR_I,
		SE,
		SENAO,
		ID,
		CTE,
		MAIS,
		MENOS,
		VEZES,
		DIVIDIR,
		ATRIB,
		PVIRG,
		DPONTOS,
		VIRG,
		ABRECH,
		ABREPAR,
		FECHACH,
		FECHAPAR,
		ESPACO,
		PROGRAMA,
		VARIAVEIS,
		INTEIRO,
		REAL,
		LOGICO,
		CARACTER,
		ESCREVA,
		LEIA,
		FALSO,
		VERDADEIRO,
		ENQUANTO,
		OPREL,
		OPAD,
		OPMUL
	};
%}

/* regular definitions */

COMMENTSINLINE "\\/\\/.*"
COMMENTSBLOCK "\\/\\*(.)*\\*\\/"
PROGRAMA "programa"
VARIAVEIS "variaveis"
INTEIRO "inteiro"
REAL "real"
LOGICO "logico"
CARACTER "caracter"
SE "se"
SENAO "senao"
ENQUANTO "enquanto"
LEIA "leia"
ESCREVA "escreva"
FALSO "falso"
VERDADEIRO "verdadeiro"
ID [a-z]+([a-z]|[0-9])*
CTE [0-9]|[0-9]+(.[0-9]+)?
CADEIA "\".*\""
ATRIB ":="
OPREL ">"|"<"|"="|">="|"<="|"<>"
OPAD [+-]
OPMUL [*/]
OPNEG "!"
PVIRG ";"
DPONTOS ":"
VIRG ","
ABREPAR "("
FECHAPAR ")"
ABRECH "{"
FECHACH "}"
ESPACO [ \t\f\r\n]+

%%

{ESPACO} {/* nenhuma ação e nenhum retorno */}
"<"	{printf("%d", MENOR_Q); return(OPREL);}
"<=" {printf("%d", MENOR_I); return(OPREL);}
"="	{printf("%d", IGUAL); return(OPREL);}
"<>" {printf("%d", DIFERENTE); return(OPREL);}
">"	{printf("%d", MAIOR_Q); return(OPREL);}
">=" {printf("%d", MAIOR_I); return(OPREL);}
"+"	{printf("%d", MAIS); return(OPAD);}
"-"	{printf("%d", MENOS); return(OPAD);}
"*"	{printf("%d", VEZES); return(OPMUL);}
"/"	{printf("%d", DIVIDIR); return(OPMUL);}
":=" {printf("%d", ATRIB); return(ATRIB);}
":" {printf("%d", DPONTOS); return(DPONTOS);}
";" {printf("%d", PVIRG); return(PVIRG);}
"," {printf("%d", VIRG); return(VIRG);}
"(" {printf("%d", ABREPAR); return(ABREPAR);}
")" {printf("%d", FECHAPAR); return(FECHAPAR);}
"{" {printf("%d", ABRECH); return(ABRECH);}
"}" {printf("%d", FECHACH); return(FECHACH);}
"programa" {return(PROGRAMA);}
"variaveis" {return(VARIAVEIS);}
"inteiro" {return(INTEIRO);}
"real" {return(REAL);}
"logico" {return(LOGICO);}
"caracter" {return(CARACTER);}
"se" {return(SE);}
"senao" {return(SENAO);}
"enquanto" {return(ENQUANTO);}
"leia" {return(LEIA);}
"escreva" {return(ESCREVA);}
"falso" {return(FALSO);}
"verdadeiro" {return(VERDADEIRO);}

%%

/**
 * 
 */

#include <stdio.h>
#include <stdlib.h>

int main(int argc, char const *argv[]) {
	
	int aux = yylex();

	printf("loucura");

	printf("%s\n", argv[0]);
	printf("%s\n", argv[1]);

	if (argv[1]) {
		printf("entrei");
		yyin = fopen(argv[1], "r");
		while (aux) {
			printf("%d\n", aux);
			aux = yylex();
		}
	}

	return 0;
}
