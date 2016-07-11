all:
	flex lex.l
	gcc lex.yy.c -o main -ll

run:
	./main
