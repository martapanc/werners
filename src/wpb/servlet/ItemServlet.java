package wpb.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.*;

import wpb.entity.FoodClass;
import wpb.entity.Item;
import wpb.manager.GenericManager;
import wpb.util.HibernateUtil;

@WebServlet(name = "ItemServlet", urlPatterns = "/item")
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

		if (paramMap.containsKey("action")) {
			String action = (String) request.getParameter("action");
			String[] ids = request.getParameterValues("id");
			long id = (ids == null || ids.length > 1) ? 0 : Long.parseLong(request.getParameter("id"));
			switch (action) {

			case "find": {
				Item item = (id == 0) ? new Item() : itmManager.get(id, true);
				List<FoodClass> fcList = fcManager.findAll();
				//request.getSession().setAttribute("fc", fcList);
				//request.getSession().setAttribute("itm", item);
				request.setAttribute("fc", fcList);
				request.setAttribute("itm", item);
				request.getRequestDispatcher("/WEB-INF/crudItem.jsp").forward(request, response);
			}
		
			case "list": {
				//Added "foodClassName" attribute to each item array for better visualizaiton in takeawayOrder.jsp
				JsonArray result = (JsonArray) new Gson().toJsonTree(itmManager.findAll());
				for (int i = 0; i<result.size(); i++) {
					JsonObject obj = result.get(i).getAsJsonObject();
					JsonObject foodCl = obj.get("foodClass").getAsJsonObject();
					obj.add("foodClassName", foodCl.get("name"));
					result.get(i).getAsJsonObject().add("foodClassName", foodCl.get("name"));
				}
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				try (PrintWriter out = response.getWriter()) {
					out.println(result.toString());
					}
				break;
			}
			
			case "listavailable": {
				List<Item> itmList =  itmManager.findAll();
				List<Item> availableItems = new ArrayList<Item>();
				
				// create new list of available items
				for(Item itm : itmList){
					if(itm.isAvailable()) {
						availableItems.add(itm);
						}
				}
				JsonArray result = (JsonArray) gson.toJsonTree(availableItems);
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				try (PrintWriter out = response.getWriter()) {
					out.println(result.toString());
					}
				break;
			}

			case "create": {
				try {
					Item itm = new Item();
					itm.setName(request.getParameter("name"));
					itm.setPrice(Double.parseDouble(request.getParameter("price")));
					FoodClass fc = fcManager.get(Long.parseLong(request.getParameter("foodClass")), true);
					itm.setFoodClass(fc);
					boolean available = (request.getParameter("available") == null) ? false : true;
					itm.setAvailable(available);
					itmManager.add(itm);
				} catch (Exception e) {
					// TODO: handle exception
				}

				break;
				}

			case "edit": {
				try {
					Item itm = itmManager.get(id, true);
					itm.setName(request.getParameter("name"));
					itm.setPrice(Double.parseDouble(request.getParameter("price")));
					itm.setVersionNumber(Integer.parseInt(request.getParameter("version-number")));
					FoodClass fc = fcManager.get(Long.parseLong(request.getParameter("foodClass")), true);
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
					for (String idString : ids) {
						itmManager.delete(itmManager.get(Long.parseLong(idString), true));
					}
					break;
				} catch (Exception e) {
					// TODO: handle exception
				}
			}
					
			}

		}
	}
}
