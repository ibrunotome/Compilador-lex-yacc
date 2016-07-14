%{

	#include "y.tab.h"

	int yylval;

	int installID() {
		return 1000;
	}
	  
%}

/* regular definitions */
ESPACO [ \t\f\r\n]+
ASPAS "\""
CADEIA {ASPAS}[^{ASPAS}]*{ASPAS}
PROGRAMA "programa"|"PROGRAMA"
VARIAVEIS "variaveis"|"VARIAVEIS"
INTEIRO "inteiro"|"INTEIRO"
REAL "real"|"REAL"
LOGICO "logico"|"LOGICO"
CARACTER "caracter"|"CARACTER"
SE "se"|"SE"
SENAO "senao"|"SENAO"
ENQUANTO "enquanto"|"ENQUANTO"
LEIA "leia"|"LEIA"
ESCREVA "escreva"|"ESCREVA"
FALSO "falso"|"FALSO"
VERDADEIRO "verdadeiro"|"VERDADEIRO"
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
ID [a-z]+([a-z]|[0-9])*
CTE [0-9]|[0-9]+(.[0-9]+)?
COMENTARIO_BLOCO [/][*][^*]*[*]+([^*/][^*]*[*]+)*[/]
COMENTARIO_LINHA "//"[^"\n"]*"\n"

%%

{ESPACO} {}
{CADEIA} {return CADEIA;}
"<"	{yylval = MENOR_Q; return MENOR_Q;}
"<=" {yylval = MENOR_I; return MENOR_I;}
"="	{yylval = IGUAL; return IGUAL;}
"<>" {yylval = DIFERENTE; return DIFERENTE;}
">"	{yylval = MAIOR_Q; return MAIOR_Q;}
">=" {yylval = MAIOR_I; return MAIOR_I;}
"+"	{yylval = MAIS; return MAIS;}
"-"	{yylval = MENOS; return MENOS;}
"*"	{yylval = VEZES; return VEZES;}
"/"	{yylval = DIVIDIR; return DIVIDIR;}
":=" {yylval = ATRIB; return ATRIB;}
":" {yylval = DPONTOS; return DPONTOS;}
";" {yylval = PVIRG; return PVIRG;}
"," {yylval = VIRG; return VIRG;}
"(" {yylval = ABREPAR; return ABREPAR;}
")" {yylval = FECHAPAR; return FECHAPAR;}
"{" {yylval = ABRECH; return ABRECH;}
"}" {yylval = FECHACH; return FECHACH;}
"!" {yylval = OPNEG; return OPNEG;}
{PROGRAMA} {yylval = installID(); return PROGRAMA;}
{VARIAVEIS} {yylval = installID(); return VARIAVEIS;}
{INTEIRO} {yylval = installID(); return INTEIRO;}
{REAL} {yylval = installID(); return REAL;}
{LOGICO} {yylval = installID(); return LOGICO;}
{CARACTER} {yylval = installID(); return CARACTER;}
{SE} {yylval = SE; return installID();}
{SENAO} {yylval = installID(); return SENAO;}
{ENQUANTO} {yylval = installID(); return ENQUANTO;}
{LEIA} {yylval = installID(); return LEIA;}
{ESCREVA} {yylval = installID(); return ESCREVA;}
{FALSO} {yylval = installID(); return FALSO;}
{VERDADEIRO} {yylval = installID(); return VERDADEIRO;}
{ID} {yylval = installID(); return ID;}
{CTE} {yylval = installID(); return CTE;}
{COMENTARIO_LINHA} {}
{COMENTARIO_BLOCO} {}
. {yylval = yytext[0]; return ERRO;}

%%
