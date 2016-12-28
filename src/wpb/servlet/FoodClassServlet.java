package wpb.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.*;

import wpb.entity.FoodClass;
import wpb.manager.GenericManager;
import wpb.util.HibernateUtil;

/**
 * Servlet implementation class ItemServlet
 */
@WebServlet(name = "foodClassServlet", urlPatterns = "/foodClass")
public class FoodClassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static GenericManager<FoodClass, Long> fcManager = null;
	private static Gson gson = null;
	
	@Override
	public void init() throws ServletException {

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
					FoodClass fc = (id == 0) ? new FoodClass() : fcManager.get(id, true);
					request.setAttribute("fc", fc);
					request.getRequestDispatcher("/WEB-INF/crudFoodClass.jsp").forward(request, response);
				}
			
				case "list": {
					JsonArray result = (JsonArray) gson.toJsonTree(fcManager.getAll());
					response.setContentType("application/json");
					response.setCharacterEncoding("UTF-8");
					try (PrintWriter out = response.getWriter()) {
						out.println(result.toString());
						}
					break;
				}

				case "create": {
					try {
						FoodClass fc = new FoodClass();
						fc.setName(request.getParameter("name"));
						fcManager.add(fc);
					} catch (Exception e) {
						// TODO: handle exception
					}

					break;
					}

				case "edit": {
					try {
						FoodClass fc = fcManager.get(id, true);
						fc.setName(request.getParameter("name"));
						fcManager.update(fc);
					} catch (Exception e) {
						// TODO: handle exception
					}

					break;
					}
				
				case "delete": {
					try {
						for (String idString : ids) {
							fcManager.delete(fcManager.get(Long.parseLong(idString), true));
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