package wpb.servlet;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wpb.entity.Role;
import wpb.entity.Role.RoleEnum;
import wpb.entity.User;
import wpb.entity.UserSession;
import wpb.manager.GenericManager;
import wpb.manager.UserManager;
import wpb.util.BCrypt;
import wpb.util.HibernateUtil;
import wpb.util.Validator;

@WebServlet(name = "RegisterServlet", urlPatterns = "/register", loadOnStartup = 1)
public class RegisterServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private final UserManager userManager = new UserManager(HibernateUtil.getSessionJavaConfigFactory());
	private final GenericManager<Role, Long> roleManager = new GenericManager<>(Role.class, HibernateUtil.getSessionJavaConfigFactory());

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// analyze parameters
		// errList gets populated if validation errors
		// while pMap contains only valid parameters
		Map<String, String[]> paramMap = request.getParameterMap();
		Map<String, Object> pMap = new HashMap<String, Object>();
		List<HashMap<String, String>> errList = new ArrayList<HashMap<String, String>>();
		analyzeParameters(paramMap, request, pMap, errList);
		if (!errList.isEmpty()) {
			
			request.setAttribute("message", errList.get(0).get("msg"));
			request.getRequestDispatcher("/registerForm.jsp").forward(request, response);
		
		} else {
			
			User user = new User();
			Role exampleRole = new Role();
			exampleRole.setName(RoleEnum.CUSTOMER);
			Role role = roleManager.getByExample(exampleRole);
			
			user.setFullName((String) pMap.get("fullname"));
			String hashPassword = BCrypt.hashpw((String) pMap.get("password"), BCrypt.gensalt());
			user.setPassword(hashPassword);
			user.setRole(role);
			user.setEmail((String) pMap.get("email"));
			user.setAvatar((String) pMap.get("avatar"));
			
			//create Timestamp
			Calendar cal = Calendar.getInstance();
			cal.setTime(new Date());
			Timestamp ts = new Timestamp(cal.getTime().getTime());
			
			user.setCreationDate(ts);
			
			userManager.add(user);

			UserSession userSession = new UserSession();
			userSession.setUser(user);
			userSession.setLoginTime(new Date());

			request.getSession(true).setAttribute("userSession", userSession);
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}
	}

	private void analyzeParameters(Map<String, String[]> paramMap, HttpServletRequest request,
			Map<String, Object> extrMap, List<HashMap<String, String>> errList) {

		List<User> userList = userManager.findAll();
		
		if (paramMap.containsKey("fullname")) {
			String fn = (String) request.getParameter("fullname");
			extrMap.put("fullname", fn);
		}

		if (paramMap.containsKey("email")) {
			String email = (String) request.getParameter("email");
			if (Validator.validateEmail(email)) {
				extrMap.put("email", email);

				// check for unique email
				for (User user : userList) {
					if (user.getEmail().equals(email)) {
						extrMap.remove("email");
						addError("email", "Email already in use", errList);
					}
				}

			} else {
				addError("email", "Not a valid email address", errList);
			}
		}

		if (paramMap.containsKey("password")) {
			String pw = (String) request.getParameter("password");
			if (paramMap.containsKey("password-confirm")) {
				String pwconfirm = (String) request.getParameter("password-confirm");
				if (pw.equals(pwconfirm)) {
					extrMap.put("password", pw);
				} else {
					addError("email", "Passwords don't match", errList);
				}
			}
		}

		if (paramMap.containsKey("avatar")) {
			String avatar = (String) request.getParameter("avatar");
			extrMap.put("avatar", avatar);
		}

	}
	
	private void addError(String pName, String errMsg, List<HashMap<String,String>> errList){
		
		HashMap<String,String> errors = new HashMap<String, String>();
		errors.put("pName", pName);
		errors.put("msg", errMsg);
		errList.add(errors);
	}
}

