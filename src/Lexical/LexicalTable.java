package Lexical;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
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
		    
		    saida.close();
		} catch (Exception e){
		    System.out.println("Problemas no arquivo de saida.\n");
		}

		
	
	}
	
	public void readTable(String path) {
		try {
			FileReader fileReader = new FileReader(path);
			BufferedReader bufferedReader = new BufferedReader(fileReader);

			String[] token;
			String line = bufferedReader.readLine();
			while(line != null){
				token = line.split("\t");
				table.add(new Token(token[1], token[3], Integer.parseInt(token[5])));
				line = bufferedReader.readLine(); 
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static void printTable(){
		for(Token token: table){
			System.out.println(token.getToken());
		}
	}
	
}
