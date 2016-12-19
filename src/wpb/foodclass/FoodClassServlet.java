package wpb.foodclass;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.*;

import wpb.GenericManager;
import wpb.HibernateUtil;
import wpb.foodclass.FoodClass;

/**
 * Servlet implementation class ItemServlet
 */
@WebServlet(name = "foodClass", urlPatterns = "/listFoodClass", loadOnStartup = 1)
public class FoodClassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static GenericManager<FoodClass, Long> fcManager = null;
	private static Gson gson = null;
	/*
	private static final TypeAdapter<Item> itemAdapter = new TypeAdapter<Item>() {

		@Override
		public Item read(JsonReader in) throws IOException {
			JsonToken peek = in.peek();
			switch (peek) {
			case BOOLEAN:
				return in.nextBoolean();
			case NULL:
				in.nextNull();
				return null;
			case NUMBER:
				return in.nextInt() != 0;
			case STRING:
				return Boolean.parseBoolean(in.nextString());
			default:
				throw new IllegalStateException("Expected BOOLEAN or NUMBER but was " + peek);
			}
		}

		@Override
		public void write(JsonWriter out, Item value) throws IOException {
			if (value == null) {
				out.nullValue();
			} else {
				if (value == true) {
					out.value(1);
				}
				// out.nullValue();
				else {
					out.value(0);
				}
			}
		}
	};*/

	@Override
	public void init() throws ServletException {

		fcManager = new GenericManager<FoodClass, Long>(FoodClass.class, HibernateUtil.getSessionJavaConfigFactory());
		gson = new GsonBuilder().create();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String json = gson.toJson(fcManager.getAll());
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		try (PrintWriter out = response.getWriter()) {
			out.println(json);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Map<String, String[]> paramMap = request.getParameterMap();
		// Enumeration paramNames = request.getParameterNames();

		if (paramMap.containsKey("action")) {
			String action = (String) request.getParameter("action");
			String data = (String) request.getParameter("data");
			switch (action) {

			case "list": {
				String json = gson.toJson(fcManager.getAll());
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				try (PrintWriter out = response.getWriter()) {
					out.println(json);
					}
				break;
			}

			case "create": {
				FoodClass fc = new FoodClass();
				JsonObject obj = gson.fromJson(data, JsonObject.class);
				fc.setName(obj.get("name").getAsString());
				fcManager.add(fc);
				break;
				}

			case "update": {
				FoodClass itm = new FoodClass();
				JsonObject obj = gson.fromJson(data, JsonObject.class);
				itm.setName(obj.get("name").getAsString());
				fcManager.update(itm);
				break;
				}
			
			case "delete": {
				//JsonObject obj = gson.fromJson(data, JsonObject.class);
				//itmManager.update(itm);
				break;
				}
			}
		}
	}
}
