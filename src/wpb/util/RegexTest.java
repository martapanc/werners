package wpb.util;

public class RegexTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
	    String regex= ".*(css|jpg|png|gif|js)$";
		//String regex= ".*\bcss\b";
		
		System.out.println(".css".matches(regex));
	}

}
