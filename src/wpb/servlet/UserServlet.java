package wpb.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.ExclusionStrategy;
import com.google.gson.FieldAttributes;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;

import wpb.entity.User;
import wpb.manager.GenericManager;
import wpb.util.HibernateUtil;

/**
 * Servlet implementation class ItemServlet
 */
@WebServlet(name = "UserServlet", urlPatterns = "/user")
public class UserServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private static GenericManager<User, Long> usrManager = null;
	private static Gson gson = null;

	@Override
	public void init() throws ServletException {

		usrManager = new GenericManager<User, Long>(User.class, HibernateUtil.getSessionJavaConfigFactory());
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
			switch (action) {
		
			case "list": {
				JsonArray result = (JsonArray) gson.toJsonTree(usrManager.findAll());
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				try (PrintWriter out = response.getWriter()) {
					out.println(result.toString());
					}
				break;
				}			
			}

		}
	}
}
