/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     MENOR_Q = 258,
     MENOR_I = 259,
     IGUAL = 260,
     DIFERENTE = 261,
     MAIOR_Q = 262,
     MAIOR_I = 263,
     SE = 264,
     SENAO = 265,
     ID = 266,
     CTE = 267,
     MAIS = 268,
     MENOS = 269,
     VEZES = 270,
     DIVIDIR = 271,
     ATRIB = 272,
     PVIRG = 273,
     DPONTOS = 274,
     VIRG = 275,
     ABRECH = 276,
     ABREPAR = 277,
     FECHACH = 278,
     FECHAPAR = 279,
     PROGRAMA = 280,
     VARIAVEIS = 281,
     INTEIRO = 282,
     REAL = 283,
     LOGICO = 284,
     CARACTER = 285,
     ESCREVA = 286,
     LEIA = 287,
     FALSO = 288,
     VERDADEIRO = 289,
     ENQUANTO = 290,
     OPREL = 291,
     OPAD = 292,
     OPMUL = 293,
     OPNEG = 294,
     CADEIA = 295,
     ERRO = 296
   };
#endif
/* Tokens.  */
#define MENOR_Q 258
#define MENOR_I 259
#define IGUAL 260
#define DIFERENTE 261
#define MAIOR_Q 262
#define MAIOR_I 263
#define SE 264
#define SENAO 265
#define ID 266
#define CTE 267
#define MAIS 268
#define MENOS 269
#define VEZES 270
#define DIVIDIR 271
#define ATRIB 272
#define PVIRG 273
#define DPONTOS 274
#define VIRG 275
#define ABRECH 276
#define ABREPAR 277
#define FECHACH 278
#define FECHAPAR 279
#define PROGRAMA 280
#define VARIAVEIS 281
#define INTEIRO 282
#define REAL 283
#define LOGICO 284
#define CARACTER 285
#define ESCREVA 286
#define LEIA 287
#define FALSO 288
#define VERDADEIRO 289
#define ENQUANTO 290
#define OPREL 291
#define OPAD 292
#define OPMUL 293
#define OPNEG 294
#define CADEIA 295
#define ERRO 296




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

