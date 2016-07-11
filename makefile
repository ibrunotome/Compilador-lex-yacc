all:
	flex lex.l
	gcc lex.yy.c -o main -lfl

run:
	./main exemplo1.txt