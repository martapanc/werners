package wpb.item;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.TypeAdapter;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonToken;
import com.google.gson.stream.JsonWriter;

import wpb.GenericManager;
import wpb.HibernateUtil;

/**
 * Servlet implementation class ItemServlet
 */
@WebServlet(name = "listItem", urlPatterns = "/listItem", loadOnStartup = 1)
public class ItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static GenericManager<FoodClass, Long> itmManager = null;
	private static Gson gson = null;
	/*
	private static final TypeAdapter<Boolean> booleanAsIntAdapter = new TypeAdapter<Boolean>() {

		@Override
		public Boolean read(JsonReader in) throws IOException {
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
		public void write(JsonWriter out, Boolean value) throws IOException {
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

		itmManager = new GenericManager<FoodClass, Long>(FoodClass.class, HibernateUtil.getSessionJavaConfigFactory());
		gson = new GsonBuilder().create();
		/*.registerTypeAdapter(Boolean.class, booleanAsIntAdapter)
				.registerTypeAdapter(boolean.class, booleanAsIntAdapter).create();*/
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String json = gson.toJson(itmManager.getAll());
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

		String json = gson.toJson(itmManager.getAll());
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		try (PrintWriter out = response.getWriter()) {
			out.println(json);
		}
	}

}
