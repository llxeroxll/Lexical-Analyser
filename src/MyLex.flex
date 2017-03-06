/* Imports */
import java.lang.String;
import java.io.*;

%%

/* configs */

%standalone
%class Main
%unicode
%line

/* todo quando iniciar */
%{
	boolean isComentario = false;
	LexicalTable lexicalTable = new LexicalTable();
%}

/* todo quando EOF */
%eof{
	if(isComentario) System.out.println("Comentário aberto e não fechado!");
	LexicalTable.writeTable();
	LexicalTable.printTable();
%eof}

/* Conjuntos */

QuebraDeLinha = \r|\n|\r\n
EspacoEmBranco = {QuebraDeLinha} | [ \t\f]



/* Tipos de Simbolos */

PalavraChave = ["program"|"var"|"integer"|"if"|"then"|"else"|"end"|"real"|"while"|"not"|"do"|"procedure"|"boolean"|"begin"]
Identificador = [:jletter:][:jletterdigit:]*
NumInteiro = [0-9]+
NumReal = [0-9]+ \. [0-9]*
Delimitador = [.|;|:|,|(|)]
Atribuicao = ":="
OPRelacionais = [=|<|>|<=|>=|<|>]
OPAditivos = [-|+|"or"]
OPMultiplicativos = [*|/|"and"]

%state PALAVRA_CHAVE, IDENTIFICADOR, NUMERO, COMENTARIO_ABERTO

%%
/* Estados */


<YYINITIAL> {
/* Palavras chave*/

	{PalavraChave}	{
						lexicalTable.addToken(yytext(), "Palavra Chave" , (int)yyline+1);
						yybegin(PALAVRA_CHAVE);
					}
	
	{Identificador}	{ 
						lexicalTable.addToken(yytext(), "Identificador" , (int)yyline+1);
						yybegin(IDENTIFICADOR);
					}
	
	{NumInteiro} 	{ 
						lexicalTable.addToken(yytext(), "Numero Inteiro" , (int)yyline+1);
						yybegin(NUMERO); 
					}
	
	{NumReal}		{
						lexicalTable.addToken(yytext(), "Numero Real" , (int)yyline+1);
						yybegin(NUMERO);
					}
	
	{Delimitador}	{
						lexicalTable.addToken(yytext(), "Delimitador" , (int)yyline+1);
						yybegin(YYINITIAL);
					}
					
	{Atribuicao}	{
						lexicalTable.addToken(yytext(), "Atribuicao" , (int)yyline+1);
						yybegin(YYINITIAL);
					}
	
	{OPRelacionais}	{
						lexicalTable.addToken(yytext(), "OP Relacional" , (int)yyline+1);
						yybegin(YYINITIAL);
					}
	
	{OPAditivos}	{
						lexicalTable.addToken(yytext(), "OP Aditivo" , (int)yyline+1);
						yybegin(YYINITIAL);
					}
	
	{OPMultiplicativos}	{
						lexicalTable.addToken(yytext(), "OP Multiplicativo" , (int)yyline+1);
						yybegin(YYINITIAL);
						}
	
	{EspacoEmBranco} {/* ignora */}
	
	"{"	{
			isComentario = true;
			yybegin(COMENTARIO_ABERTO);
		}
	
	[^] {
			System.out.println("Simbolo Inválido: " + yytext() + " - linha: " + String.valueOf(yyline+1));
		}
}

<PALAVRA_CHAVE>	{
	
	{Delimitador}	{
						lexicalTable.addToken(yytext(), "Delimitador" , (int)yyline+1);
						yybegin(YYINITIAL);
					}
					
	{EspacoEmBranco}	{ yybegin(YYINITIAL); }
	
	"{"	{
			isComentario = true;
			yybegin(COMENTARIO_ABERTO);
		}
	
	[^] {
			System.out.println("Simbolo Inválido: " + yytext() + " - linha: " +  (int)yyline+1);
		}
}

<IDENTIFICADOR> {
	
	{Delimitador}	{
						lexicalTable.addToken(yytext(), "Delimitador" , (int)yyline+1);
						yybegin(YYINITIAL);
					}
					
	{Atribuicao}	{
						lexicalTable.addToken(yytext(), "Atribuicao" , (int)yyline+1);
						yybegin(YYINITIAL);
					}
	
	{OPRelacionais}	{
						lexicalTable.addToken(yytext(), "OP Relacional" , (int)yyline+1);
						yybegin(YYINITIAL);
					}
	
	{OPAditivos}	{
						lexicalTable.addToken(yytext(), "OP Aditivo" , (int)yyline+1);
						yybegin(YYINITIAL);
					}
	
	{OPMultiplicativos}	{
						lexicalTable.addToken(yytext(), "OP Multiplicativo" , (int)yyline+1);
						yybegin(YYINITIAL);
					}
	
	
	{EspacoEmBranco} { yybegin(YYINITIAL); }
	
	"{"	{
			isComentario = true;
			yybegin(COMENTARIO_ABERTO);
		}
	
	[^] {
			System.out.println("Simbolo Inválido: " + yytext() + " - linha: " + String.valueOf(yyline+1));
		}

}

<NUMERO> {
	
	{Delimitador}	{
						lexicalTable.addToken(yytext(), "Delimitador" , (int)yyline+1);
						yybegin(YYINITIAL);
					}
					
	{Atribuicao}	{
						lexicalTable.addToken(yytext(), "Atribuicao" , (int)yyline+1);
						yybegin(YYINITIAL);
					}
	
	{OPRelacionais}	{
						lexicalTable.addToken(yytext(), "OP Relacional" , (int)yyline+1);
						yybegin(YYINITIAL);
					}
	
	{OPAditivos}	{
						lexicalTable.addToken(yytext(), "OP Aditivo" , (int)yyline+1);
						yybegin(YYINITIAL);
					}
	
	{OPMultiplicativos}	{
						lexicalTable.addToken(yytext(), "OP Multiplicativo" , (int)yyline+1);
						yybegin(YYINITIAL);
					}
	
	
	{EspacoEmBranco} { yybegin(YYINITIAL); }
	
	"{"	{
			isComentario = true;
			yybegin(COMENTARIO_ABERTO);
		}
	
	[^] {
			System.out.println("Simbolo Inválido: + yytext() " + " - linha: " + String.valueOf(yyline+1));
		}
	
}

<COMENTARIO_ABERTO>{

	"}" {	
			isComentario = false;
			yybegin(YYINITIAL);
		}
	
	[^] { /* continua */}

}
