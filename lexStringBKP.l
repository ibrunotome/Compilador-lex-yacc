%{
	#define MENOR_Q "OPREL"
	#define MENOR_I "OPREL"
	#define IGUAL "OPREL"
	#define DIFERENTE "OPREL"
	#define MAIOR_Q "OPREL"
	#define MAIOR_I "OPREL"
	#define SE "SE"
	#define SENAO "SENAO"
	#define ID "ID"
	#define CTE "CTE"
	#define MAIS "OPAD"
	#define MENOS "OPAD"
	#define VEZES "OPMUL"
	#define DIVIDIR "OPMUL"
	#define ATRIB "ATRIB"
	#define PVIRG "PVIRG"
	#define DPONTOS "DPONTOS"
	#define VIRG "VIRG"
	#define ABRECH "ABRECH"
	#define ABREPAR "ABREPAR"
	#define FECHACH "FECHACH"
	#define FECHAPAR "FECHAPAR"
	#define ESPACO "ESPACO"
	#define PROGRAMA "PROGRAMA"
	#define VARIAVEIS "VARIAVEIS"
	#define INTEIRO "INTEIRO"
	#define REAL "REAL"
	#define LOGICO "LOGICO"
	#define CARACTER "CARACTER"
	#define ESCREVA "ESCREVA"
	#define LEIA "LEIA"
	#define FALSO "FALSO"
	#define VERDADEIRO "VERDADEIRO"
	#define ENQUANTO "ENQUANTO"
	#define OPREL "OPREL"
	#define OPAD "OPAD"
	#define OPMUL "OPMUL"
	#define OPNEG "OPNEG"
	#define CADEIA "CADEIA"
%}

/* regular definitions */
ESPACO [ \t\f\r\n]+
ASPAS ["]
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
CADEIA {ASPAS}[^{ASPAS}]*{ASPAS}
ID [a-z]+([a-z]|[0-9])*
CTE [0-9]|[0-9]+(.[0-9]+)?
COMENTARIO_BLOCO [/][*][^*]*[*]+([^*/][^*]*[*]+)*[/]  
COMENTARIO_LINHA "//"[^"\n"]*"\n"

%%

{ESPACO} {}
{CADEIA} {}
"<"	{printf("%s\n", MENOR_Q);}
"<=" {printf("%s\n", MENOR_I);}
"="	{printf("%s\n", IGUAL);}
"<>" {printf("%s\n", DIFERENTE);}
">"	{printf("%s\n", MAIOR_Q);}
">=" {printf("%s\n", MAIOR_I);}
"+"	{printf("%s\n", MAIS);}
"-"	{printf("%s\n", MENOS);}
"*"	{printf("%s\n", VEZES);}
"/"	{printf("%s\n", DIVIDIR);}
":=" {printf("%s\n", ATRIB);}
":" {printf("%s\n", DPONTOS);}
";" {printf("%s\n", PVIRG);}
"," {printf("%s\n", VIRG);}
"(" {printf("%s\n", ABREPAR);}
")" {printf("%s\n", FECHAPAR);}
"{" {printf("%s\n", ABRECH);}
"}" {printf("%s\n", FECHACH);}
"!" {printf("%s\n", OPNEG);}
{PROGRAMA} {printf("%s\n", PROGRAMA);}
{VARIAVEIS} {printf("%s\n", VARIAVEIS);}
{INTEIRO} {printf("%s\n", INTEIRO);}
{REAL} {printf("%s\n", REAL);}
{LOGICO} {printf("%s\n", LOGICO);}
{CARACTER} {printf("%s\n", CARACTER);}
{SE} {printf("%s\n", SE);}
{SENAO} {printf("%s\n", SENAO);}
{ENQUANTO} {printf("%s\n", ENQUANTO);}
{LEIA} {printf("%s\n", LEIA);}
{ESCREVA} {printf("%s\n", ESCREVA);}
{FALSO} {printf("%s\n", FALSO);}
{VERDADEIRO} {printf("%s\n", VERDADEIRO);}
{ID} {printf("%s\n", ID);}
{CTE} {printf("%s\n", CTE);}
{COMENTARIO_LINHA} {}
{COMENTARIO_BLOCO} {}

%%

/**
 * 
 */

int main(int argc, char const *argv[]) {
	
	yyin = fopen(argv[1], "r");
	yylex();
	

	return 0;
}
