#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "hash.h"

#define TAM 1023

typedef union noh {
	char *lexema;
	int pLexema;
} noh;

struct s_Yylval {
	int flag;
	noh lexema;
	int linha;
	int coluna;
	Yylval *prox;
};

typedef struct hashTable {
	int key;
	Yylval yylval;
} hashTable;


void criaTabela(hashTable *tabela) {
	tabela = malloc(TAM*sizeof(hashTable));
	for (int i = 0; i < TAM; ++i) {
		tabela[i].key = -1;
		tabela[i].yylval->flag = -1;
		tabela[i].yylval->lexema.pLexema = -1;
		tabela[i].yylval->linha = -1;
		tabela[i].yylval->coluna = -1;
		tabela[i].yylval->prox = NULL;
	}
}

void addTabela(hashTable *tabela, Yylval token, int chave) {
	tabela[chave].key = chave;
	tabela[chave].yylval = token;
}

void imprimirTabela(hashTable *tabela) {
	int chave = 0;
	while(tabela[chave].key != -1) {
		if (tabela[chave].yylval->flag == 0) {
			printf("lexema: %s\t linha: %d\t coluna: %d\n", tabela[chave].yylval->lexema.lexema, tabela[chave].yylval->linha, tabela[chave].yylval->coluna);
		} else {
			printf("lexema: %d\t linha: %d\t coluna: %d\n", tabela[chave].yylval->lexema.pLexema, tabela[chave].yylval->linha, tabela[chave].yylval->coluna);
		}
		chave++;
	}
}

int main(int argc, char const *argv[]) {
	return 0;
}
