package wpb.util;

import com.google.gson.*;

public class Wrapper {
	String name;
	int qnt;
	float totPrice;
	float uPrice;
	
	public static void main(String[] args) {
		String str = "{\"jcart\":[{\"name\":\"1as50bg63bpkhonpuephbo47v7\",\"qnt\":1,\"totPrice\":6.76,\"uPrice\":6.76},{\"name\":\"o9p56ndd3e9h7u2tbcs70pvcur\",\"qnt\":1,\"totPrice\":4.17,\"uPrice\":4.17}]}";
		JsonParser parser = new JsonParser();
		
		
		JsonArray cart = parser.parse(str).getAsJsonObject().get("jcart").getAsJsonArray();
		
		Gson gson = new Gson();
		Wrapper[] arr = gson.fromJson(cart, Wrapper[].class);
		for (int i = 0; i < arr.length; i++)
			System.out.println(arr[i].name + " " + arr[i].totPrice + " " + arr[i].uPrice);
		
		System.out.println("Viale abbiategrasso marittimo 123456, Abbiategrasso, San Felice sul panaro".matches("[\\p{L}0-9-,.' ]{5,100}"));
	}
}


