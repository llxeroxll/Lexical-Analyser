import java.io.FileWriter;
import java.util.ArrayList;

public class LexicalTable {
	
	private static ArrayList<Token> table;
	
	public LexicalTable(){
		this.table = new ArrayList<Token>();
	}
	
	public void addToken(String id, String tipo, int linha){
		Token newToken = new Token(id, tipo, linha);
		table.add(newToken);
	}
	
	public static void writeTable(){
		
		try{
		    FileWriter saida = new FileWriter("saida.txt");
		    
		    for(Token token: table){
				saida.write(token.getToken() + "\n");
			}
		    
		} catch (Exception e){
		    System.out.println("Problemas no arquivo de saida.\n");
		}

		
	
	}
	
	public static void printTable(){
		for(Token token: table){
			System.out.println(token.getToken());
		}
	}
	
}
