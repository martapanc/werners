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

			case "find": {
				Item item = (id == 0) ? new Item() : itmManager.find(id, true);
				List<FoodClass> fcList = fcManager.getAll();
				request.getSession().setAttribute("fc", fcList);
				request.getSession().setAttribute("itm", item);
				request.setAttribute("fc", fcList);
				request.setAttribute("itm", item);
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
					itm.setVersionNumber(Integer.parseInt(request.getParameter("version-number")));
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
					
			case "refresh": {
				request.getRequestDispatcher("/WEB-INF/crudItem.jsp").forward(request, response);
				break;
				}
			}

		}
	}
}
