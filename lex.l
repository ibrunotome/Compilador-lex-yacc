%{
	enum {
		MENOR_Q = 256,
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
		OPMUL,
		OPNEG,
		CADEIA,
		ERRO
	};
	  
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
{PROGRAMA} {printf("%d\n", PROGRAMA); return PROGRAMA;}
{VARIAVEIS} {printf("%d\n", VARIAVEIS); return VARIAVEIS;}
{INTEIRO} {printf("%d\n", INTEIRO); return INTEIRO;}
{REAL} {printf("%d\n", REAL); return REAL;}
{LOGICO} {printf("%d\n", LOGICO); return LOGICO;}
{CARACTER} {printf("%d\n", CARACTER); return CARACTER;}
{SE} {printf("%d\n", SE); return SE;}
{SENAO} {printf("%d\n", SENAO); return SENAO;}
{ENQUANTO} {printf("%d\n", ENQUANTO); return ENQUANTO;}
{LEIA} {printf("%d\n", LEIA); return LEIA;}
{ESCREVA} {printf("%d\n", ESCREVA); return ESCREVA;}
{FALSO} {printf("%d\n", FALSO); return FALSO;}
{VERDADEIRO} {printf("%d\n", VERDADEIRO); return VERDADEIRO;}
{ID} {yylval = installID(); return ID;}
{CTE} {printf("%d\n", CTE); return CTE;}
{COMENTARIO_LINHA} {}
{COMENTARIO_BLOCO} {}
. {yylval = yytext[0]; return ERRO;}

%%

/**
 * 
 */

int main(int argc, char const *argv[]) {
	
	yyin = fopen(argv[1], "r");
	int aux = 1;

	while (aux) {
		aux = yylex();
	}
	
	return 0;
}
