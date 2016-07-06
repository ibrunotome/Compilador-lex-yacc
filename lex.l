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
		OPMUL,
		OPNEG
	};
%}

/* regular definitions */
ESPACO [ \t\f\r\n]+
ASPAS ["]
CADEIA {ASPAS}[^{ASPAS}]*{ASPAS}
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
COMENTARIO_BLOCO "/*"[^"*/"]*"*/"
COMENTARIO_LINHA "//"[^"\n"]*"\n"

%%

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
"!" {printf("%d", OPNEG); return(OPNEG);}
{ESPACO} {}
{PROGRAMA} {return(PROGRAMA);}
{VARIAVEIS} {return(VARIAVEIS);}
{INTEIRO} {return(INTEIRO);}
{REAL} {return(REAL);}
{LOGICO} {return(LOGICO);}
{CARACTER} {return(CARACTER);}
{SE} {return(SE);}
{SENAO} {return(SENAO);}
{ENQUANTO} {return(ENQUANTO);}
{LEIA} {return(LEIA);}
{ESCREVA} {return(ESCREVA);}
{FALSO} {return(FALSO);}
{VERDADEIRO} {return(VERDADEIRO);}
{ID} {return(ID);}
{CTE} {return(CTE);}

%%

/**
 * 
 */

int main(int argc, char const *argv[]) {
	
	int aux = 1;

	if (argv[1]) {
		yyin = fopen(argv[1], "r");
		while (aux) {
			printf("\n");
			aux = yylex();
		}
	}

	return 0;
}
