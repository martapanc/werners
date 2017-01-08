package wpb.servlet;

import java.io.*;
import java.sql.Timestamp;
import java.util.*;

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
	private static GenericManager<OrderItem, Long> oiManager = null;
	private static GenericManager<User, Long> userManager = null;
	private static GenericManager<Item,Long> itemManager = null;
	User user = new User();
	TakeawayOrder to = new TakeawayOrder();
	OrderItem oi;
	@Override
	public void init() throws ServletException {
		oiManager = new GenericManager<OrderItem, Long>(OrderItem.class, HibernateUtil.getSessionJavaConfigFactory());
		toManager = new GenericManager<TakeawayOrder, Long>(TakeawayOrder.class, HibernateUtil.getSessionJavaConfigFactory());
		userManager = new GenericManager<User, Long>(User.class, HibernateUtil.getSessionJavaConfigFactory());
		itemManager = new GenericManager<Item, Long>(Item.class, HibernateUtil.getSessionJavaConfigFactory());
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
		
		//formValidation(paramMap, request, pMap, errList);
		System.out.println("address: " + request.getParameter("address"));
		if (paramMap.containsKey("action")) {
			String action = request.getParameter("action");
			
			if(action.equals("list")) {
				JsonArray result = (JsonArray) new Gson().toJsonTree(toManager.getAll());
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				try (PrintWriter out = response.getWriter()) {
					out.println(result.toString());
				}
			}
			
		} else {
			/*
			String title = request.getParameter("title");
			String fn = request.getParameter("firstname");
			String ln = request.getParameter("lastname");
			user.setFullName(title + " " + fn + " " + ln);
			user.setPhoneNumber(request.getParameter("telephone"));
			
			user.setEmail(request.getParameter("email"));
			user.setBillingAddress(request.getParameter("address"));
			user.setAvatar("/restaurantProject/dist/img/gusteau160x160.jpg");
			Calendar cal = Calendar.getInstance();
			cal.setTime(new Date());
			Timestamp ts = new Timestamp(cal.getTime().getTime());
			user.setCreationDate(ts);
			//userManager.add(user);
			*/
			
			Long id = Long.parseLong(request.getParameter("session"));
			to.setGuest(userManager.get(id, true));
			to.setAddress(request.getParameter("address"));
			to.setCost(Float.parseFloat(request.getParameter("tot")));
			//to.setGuest(user);
			to.setStatus("pronto");
			
			JsonParser parser = new JsonParser();
			JsonArray arr = parser.parse(cart).getAsJsonArray();
			Set<OrderItem> orderItemList = new HashSet<OrderItem>();
			for (int i=0; i<arr.size(); i++) {
				JsonObject o = arr.get(i).getAsJsonObject();
				oi = new OrderItem();
				oi.setQuantity(o.get("qnt").getAsInt());
				oi.setItem(itemManager.get(o.get("id").getAsLong(), true));
				oi.setVersionNumber(0);
				orderItemList.add(oi);
			}
			System.out.println("Order item list: " + orderItemList.toString());
			
			to.setOrderItemList(orderItemList);
			
			toManager.add(to);
			
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			System.out.println(orderItemList.toString());
			response.getWriter().write(data);
			
			PrintWriter out = response.getWriter();
			out.println(data);
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
