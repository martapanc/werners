package wpb.item;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.*;

import wpb.GenericManager;
import wpb.HibernateUtil;
import wpb.Restaurant;
import wpb.foodclass.FoodClass;

/**
 * Servlet implementation class ItemServlet
 */
@WebServlet(name = "listItem", urlPatterns = "/listItem", loadOnStartup = 1)
public class ItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static GenericManager<Item, Long> itmManager = null;
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

		itmManager = new GenericManager<Item, Long>(Item.class, HibernateUtil.getSessionJavaConfigFactory());
		fcManager = new GenericManager<FoodClass, Long>(FoodClass.class, HibernateUtil.getSessionJavaConfigFactory());
		gson = new GsonBuilder().create();
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
			String[] ids = request.getParameterValues("id");
			long id = (request.getParameter("id") == null) ? 0 : Long.parseLong(request.getParameter("id"));
			switch (action) {

			case "get": {
				Restaurant item = itmManager.find(id, true);
				String formAction = null;
				if(item==null){
					item = new Item();
					formAction = "create";
				}
				else {
					formAction = "update";
				}
				List<FoodClass> fcList = fcManager.getAll();
				request.setAttribute("fc", fcList);
				request.setAttribute("itm", item);
				request.setAttribute("formaction", formAction);
				request.getRequestDispatcher("/WEB-INF/editItem.jsp").forward(request, response);
			}
		
			case "list": {
				String json = gson.toJson(itmManager.getAll());
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				try (PrintWriter out = response.getWriter()) {
					out.println(json);
					}
				break;
			}

			case "create": {
				try {
					Item itm = new Item();
					itm.setName(request.getParameter("name"));
					itm.setPrice(Double.parseDouble(request.getParameter("price")));
					FoodClass fc = fcManager.find(Long.parseLong(request.getParameter("foodClass")), true);
					itm.setFoodClass(fc);
					boolean available = (request.getParameter("available") == null) ? false : true;
					itm.setAvailable(available);
					itmManager.add(itm);
				} catch (Exception e) {
					// TODO: handle exception
				}

				break;
				}

			case "update": {
				try {
					Item itm = itmManager.find(id, true);
					itm.setName(request.getParameter("name"));
					itm.setPrice(Double.parseDouble(request.getParameter("price")));
					FoodClass fc = fcManager.find(Long.parseLong(request.getParameter("foodClass")), true);
					itm.setFoodClass(fc);
					boolean available = (request.getParameter("available") == null) ? false : true;
					itm.setAvailable(available);
					itmManager.update(itm);
				} catch (Exception e) {
					// TODO: handle exception
				}

				break;
				}
			
			case "delete": {
				try {
					//
					// itm = gson.fromJson(id, Item.class);
					for (String idString : ids) {
						itmManager.delete(itmManager.find(Long.parseLong(idString), true));
					}
					break;
				} catch (Exception e) {
					// TODO: handle exception
				}
			}
			
			default: {
				response.sendError(500);
				break;
				}
			
			}
			
		}
	}
}
