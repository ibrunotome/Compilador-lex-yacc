all:
	yacc -d sintatico.y
	lex lex.l
	gcc y.tab.c -o main -ansi -ll
	./main "exemplos/exemplo1.txt"
