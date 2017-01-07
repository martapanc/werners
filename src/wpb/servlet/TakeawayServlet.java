package wpb.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.*;

import wpb.entity.*;
import wpb.manager.GenericManager;
import wpb.util.HibernateUtil;

import org.apache.commons.validator.routines.EmailValidator;

@WebServlet(name = "TakeawayServlet", urlPatterns = "/takeaway")
public class TakeawayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static GenericManager<TakeawayOrder, Long> toManager = null;
	private static GenericManager<Item, Long> itmManager = null;
	User user = new User();
	@Override
	public void init() throws ServletException {
		itmManager = new GenericManager<Item, Long>(Item.class, HibernateUtil.getSessionJavaConfigFactory());
		toManager = new GenericManager<TakeawayOrder, Long>(TakeawayOrder.class, HibernateUtil.getSessionJavaConfigFactory());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Map<String, String[]> paramMap = request.getParameterMap();
		String cart = (String) request.getParameter("cart");
		String data = (String) request.getParameter("data");
		
		//Map<String, Object> pMap = new HashMap<String, Object>();
		//List<HashMap<String, String>> errList = new ArrayList<HashMap<String, String>>();
		//JsonArray jdata = (JsonArray) new Gson().toJsonTree(data);
		//formValidation(paramMap, request, pMap, errList);
		
		if (paramMap.containsKey("action")) {
			String action = request.getParameter("action");
			
			if(action.equals("list")) {
				JsonArray result = (JsonArray) new Gson().toJsonTree(toManager.getAll());
				//System.out.println(resManager.get((long) 99, true));
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				try (PrintWriter out = response.getWriter()) {
					out.println(result.toString());
				}
				
			}
			
			
		} else {
			
			String title = request.getParameter("title");
			String fn = request.getParameter("firstname");
			String ln = request.getParameter("lastname");
			user.setFullName(title + " " + fn + " " + ln);
			user.setPhoneNumber(request.getParameter("telephone"));
			if (paramMap.containsKey("email"))
				user.setEmail(request.getParameter("email"));
			user.setBillingAddress(request.getParameter("address"));
			
			
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			System.out.println(data + " - " + cart);
			response.getWriter().write(data);
			
			PrintWriter out = response.getWriter();
		}
		
		
		//if (!errList.isEmpty()) {
			//String json = new Gson().toJson(errList);
			
			//out.println(paramMap);
		/*} else {
			request.setAttribute("map", pMap);
			request.getRequestDispatcher("pages/customer/takeawayInvoice.jsp").forward(request, response);
		}*/
	}

	private void formValidation(Map<String, String[]> paramMap, HttpServletRequest request, Map<String, Object> extrMap,
			List<HashMap<String, String>> errList) {

		if (paramMap.containsKey("title")) {
			String title = (String) request.getParameter("title");
			System.out.println(request.getParameter("title"));
			extrMap.put("title", title);
		}

		if (paramMap.containsKey("firstname")) {
			String fn = (String) request.getParameter("firstname");
			if (fn.matches("^[\\p{L} .'-]+$")) {
				extrMap.put("firstname", fn);
			} else {
				addError("firstname", "Please insert a valid first name", errList);
			}
		}

		if (paramMap.containsKey("lastname")) {
			String ln = (String) request.getParameter("lastname");
			if (ln.matches("^[\\p{L} .'-]+$")) {
				extrMap.put("lastname", ln);
			} else {
				addError("lastname", "Please insert a valid last name", errList);
			}
		}

		if (paramMap.containsKey("telephone")) {
			String tel = (String) request.getParameter("telephone");
			if (tel.matches("\\d{10}")) {
				extrMap.put("telephone", tel);
			} else {
				addError("telephone", "Please insert a valid telephone number", errList);
			}
		}

		EmailValidator validator = EmailValidator.getInstance();
		if (paramMap.containsKey("email")) {
			String email = (String) request.getParameter("email");
			if (validator.isValid(email)) {
				extrMap.put("email", email);
			} else {
				addError("email", "Please insert a valid email address", errList);
			}
		} else {
			extrMap.put("email", "");
		}

		if (paramMap.containsKey("address")) {
			String address = (String) request.getParameter("address");
			if (address.matches("[\\p{L}0-9-,.' ]{5,100}")) {
				extrMap.put("address", address);
			} else {
				addError("address", "Please check the delivery address", errList);
			}
		}

	}

	private void addError(String pName, String errMsg, List<HashMap<String, String>> errList) {

		HashMap<String, String> errors = new HashMap<String, String>();
		errors.put("pName", pName);
		errors.put("msg", errMsg);
		errList.add(errors);
	}

}
