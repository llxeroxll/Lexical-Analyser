package SemanticAnalizer;

public class Main {

	public static void main(String[] args) {
		
		Semantic s = new Semantic();
		s.table.readTable("C:\\saida.txt");
		s.table.printTable();
		

	}

}
