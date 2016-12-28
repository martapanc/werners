package wpb.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wpb.entity.User;
import wpb.entity.UserSession;
import wpb.manager.UserManager;
import wpb.util.HibernateUtil;

@WebServlet(name = "LoginServlet", urlPatterns = "/login")
public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private final UserManager userManager = new UserManager(HibernateUtil.getSessionJavaConfigFactory());

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("email");
		String password = request.getParameter("password");

		if (username != null && password != null) {
			try {
				User user = userManager.getByEmailPassword(username, password);

				if (user != null) {
					System.out.println("[LoginServlet] User : " + user.getId());
					System.out.println("[LoginServlet] LoginTime : " + new Date());
					
					UserSession userSession = new UserSession();
					userSession.setUser(user);
					userSession.setLoginTime(new Date());

					request.getSession(true).setAttribute("userSession", userSession);

					response.sendRedirect("index.jsp");
				} else {
					request.setAttribute("message", "Invalid username or password");
					request.getRequestDispatcher("/loginForm.jsp").forward(request, response);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			request.setAttribute("message", "Insert username and password!");
			request.getRequestDispatcher("/loginForm.jsp").forward(request, response);
		}
	}
}
