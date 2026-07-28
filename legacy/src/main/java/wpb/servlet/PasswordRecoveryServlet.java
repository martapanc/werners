package wpb.servlet;

import java.io.IOException;
import java.math.BigInteger;
import java.security.SecureRandom;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wpb.entity.User;
import wpb.manager.GenericManager;
import wpb.util.BCrypt;
import wpb.util.HibernateUtil;
import wpb.util.SendMailTLS;
import wpb.util.Validator;

/**
 * Servlet implementation class PasswordRecoveryServlet
 */
@WebServlet("/RecoveryServlet")
public class PasswordRecoveryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static GenericManager<User, Long> userManager = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public void init() throws ServletException {
    	userManager = new GenericManager<User, Long>(User.class, HibernateUtil.getSessionJavaConfigFactory());
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Map<String, Object> pMap = new HashMap<String, Object>();
		String email = request.getParameter("email");
		List<User> userList = userManager.findAll();
		if (Validator.validateEmail(email)) {

			for (User user : userList) {
				if (user.getEmail().equals(email)) {
					pMap.put("fullname", user.getFullName());
					pMap.put("email", user.getEmail());
					
					SecureRandom random = new SecureRandom();
					String temp = new BigInteger(130, random).toString(32).substring(0,12);
					String hashPassword = BCrypt.hashpw(temp, BCrypt.gensalt());
					user.setPassword(hashPassword);
					userManager.update(user);
					pMap.put("pw", temp);
					SendMailTLS.sendRecoveryEmail(pMap);
				}
			}
			request.getRequestDispatcher("/loginForm.jsp").forward(request, response);
		} else {
			System.out.println("Not a valid email address");
		}
		
	}

}
