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

import wpb.entity.User;
import wpb.manager.GenericManager;
import wpb.util.BCrypt;
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
				case "name": {
					String firstname = request.getParameter("firstname");
					String lastname = request.getParameter("lastname");
					long id = Long.parseLong(request.getParameter("session"));
					User user = usrManager.get(id, true);
					user.setFullName(firstname + " " + lastname);
					usrManager.update(user);
					request.getRequestDispatcher("profile.jsp").forward(request, response);
					break;
				}	
				case "telephone": {
					String tel = request.getParameter("telephone");
					long id = Long.parseLong(request.getParameter("session"));
					User user = usrManager.get(id, true);
					user.setPhoneNumber(tel);
					usrManager.update(user);
					try (PrintWriter out = response.getWriter()) {
						out.println(tel);
					}
					break;
				}
				case "address": {
					String add = request.getParameter("address");
					long id = Long.parseLong(request.getParameter("session"));
					User user = usrManager.get(id, true);
					user.setBillingAddress(add);
					usrManager.update(user);
					try (PrintWriter out = response.getWriter()) {
						out.println(add);
					}
					break;
				}
				case "pw": {
					String old = request.getParameter("oldPw");
					String new1 = request.getParameter("newPass1");
					String new2 = request.getParameter("newPass2");
					long id = Long.parseLong(request.getParameter("session"));
					User user = usrManager.get(id, true);
					if(new1.equals(new2) && BCrypt.checkpw(old, user.getPassword())) {
						String hashPassword = BCrypt.hashpw(new1, BCrypt.gensalt());
						user.setPassword(hashPassword);
						usrManager.update(user);
						try (PrintWriter out = response.getWriter()) {
							out.println("Your password was successfully changed!");
						}
					} else {
						try (PrintWriter out = response.getWriter()) {
							out.println("You must insert your current password in order to change it.");
						}
					}
					break;
				}
				
				case "getData": {
					long id = Long.parseLong(request.getParameter("session"));
					JsonParser parser = new JsonParser();
					Gson gson = new Gson();
					User user = usrManager.get(id, true);
					String jUser = gson.toJson(user);
					JsonObject o = parser.parse(jUser).getAsJsonObject();
					response.setContentType("application/json");
					response.setCharacterEncoding("UTF-8");
					try (PrintWriter out = response.getWriter()) {
						out.println(o);
					}
					break;
				}
			}
		}
	}
}
