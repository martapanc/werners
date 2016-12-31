package wpb.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;

import wpb.entity.RoomTable;
import wpb.entity.RoomTable.CategoryType;
import wpb.manager.GenericManager;
import wpb.util.HibernateUtil;

@WebServlet(name = "RoomTableServlet", urlPatterns = "/roomTable")
public class RoomTableServlet extends HttpServlet {
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
					RoomTable rt = (id == 0) ? new RoomTable() : rtManager.get(id, true); 
					List<String> categories = new ArrayList<String>(); 
					for(CategoryType s : RoomTable.CategoryType.values()){
						categories.add(s.toString());
					}
					request.setAttribute("rt", rt);
					request.setAttribute("categories", categories);
					request.getRequestDispatcher("/WEB-INF/crudTable.jsp").forward(request, response);
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
						rt.setSeats(Integer.parseInt(request.getParameter("seats")));
						rt.setRoom(request.getParameter("room"));
						rt.setCategory(RoomTable.CategoryType.valueOf(request.getParameter("category")));
						rtManager.add(rt);
					} catch (Exception e) {
						// TODO: handle exception
					}

					break;
					}

				case "edit": {
					try {
						RoomTable rt = rtManager.get(id, true);
						rt.setName(request.getParameter("name"));
						rt.setSeats(Integer.parseInt(request.getParameter("seats")));
						rt.setRoom(request.getParameter("room"));
						rt.setCategory(RoomTable.CategoryType.valueOf(request.getParameter("category")));
						rtManager.update(rt);
					} catch (Exception e) {
						// TODO: handle exception
					}

					break;
					}
				
				case "delete": {
					try {
						for (String idString : ids) {
							rtManager.delete(rtManager.get(Long.parseLong(idString), true));
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