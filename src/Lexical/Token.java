package Lexical;

public class Token {
	private String Identificador;
	private String tipo;
	private int linha;
	
	public Token(String id, String tipo, int linha){
		this.Identificador = id;
		this.tipo = tipo;
		this.linha = linha;
	}
	
	public String getToken(){
		return "\t" + Identificador + "\t\t" + tipo + "\t\t" + linha ;
	}
	
}
