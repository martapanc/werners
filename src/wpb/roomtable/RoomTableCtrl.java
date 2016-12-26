package wpb.roomtable;

import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "roomTableCtrl", urlPatterns = "/roomTable", loadOnStartup = 1)
public class RoomTableCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static GenericManager<RoomTable, Long> rtManager = null;
	private static Gson gson = null;
	
	@Override
	public void init() throws ServletException {

		rtManager = new GenericManager<RoomTable, Long>(RoomTable.class, HibernateUtil.getSessionJavaConfigFactory());
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
					RoomTable rt = (id == 0) ? new RoomTable() : rtManager.find(id, true);
					request.setAttribute("rt", rt);
					request.getRequestDispatcher("/WEB-INF/crudRoomTable.jsp").forward(request, response);
				}
			
				case "list": {
					JsonArray result = (JsonArray) gson.toJsonTree(rtManager.getAll());
					response.setContentType("application/json");
					response.setCharacterEncoding("UTF-8");
					try (PrintWriter out = response.getWriter()) {
						out.println(result.toString());
						}
					break;
				}

				case "create": {
					try {
						RoomTable rt = new RoomTable();
						rt.setName(request.getParameter("name"));
						rtManager.add(rt);
					} catch (Exception e) {
						// TODO: handle exception
					}

					break;
					}

				case "edit": {
					try {
						RoomTable rt = rtManager.find(id, true);
						rt.setName(request.getParameter("name"));
						rtManager.update(rt);
					} catch (Exception e) {
						// TODO: handle exception
					}

					break;
					}
				
				case "delete": {
					try {
						for (String idString : ids) {
							rtManager.delete(rtManager.find(Long.parseLong(idString), true));
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