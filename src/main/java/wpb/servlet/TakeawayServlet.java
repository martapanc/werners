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
import wpb.util.SendMailTLS;
import wpb.util.Validator;

@WebServlet(name = "TakeawayServlet", urlPatterns = "/takeaway")
public class TakeawayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static GenericManager<TakeawayOrder, Long> toManager = null;
	private static GenericManager<User, Long> userManager = null;
	private static GenericManager<Item,Long> itemManager = null;
	User user = new User();
	
	TakeawayOrder to = new TakeawayOrder();
	OrderItem oi;
	@Override
	public void init() throws ServletException {
		toManager = new GenericManager<TakeawayOrder, Long>(TakeawayOrder.class, HibernateUtil.getSessionJavaConfigFactory());
		userManager = new GenericManager<User, Long>(User.class, HibernateUtil.getSessionJavaConfigFactory());
		itemManager = new GenericManager<Item, Long>(Item.class, HibernateUtil.getSessionJavaConfigFactory());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Calendar cal = Calendar.getInstance();
		Map<String, String[]> paramMap = request.getParameterMap();
		Map<String, Object> pMap = new HashMap<String, Object>();
		String cart = (String) pMap.get("cart");
		analyzeParameters(paramMap, request, pMap);
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

			String idStr = (String) pMap.get("session");
			if (!idStr.equals("")) {
				Long id= Long.parseLong(idStr);
				to.setGuest(userManager.get(id, true));
			} else
				to.setGuest(null);
			
			Timestamp ts1 = new Timestamp(cal.getTime().getTime());
			to.setOrderDate(ts1);
			to.setAddress( (String) pMap.get("address"));
			to.setCost( (float) pMap.get("tot"));
			to.setStatus("pronto");
			
			JsonParser parser = new JsonParser();
			JsonArray arr = parser.parse( (String) pMap.get("cart")).getAsJsonArray();
			Set<OrderItem> orderItemList = new HashSet<OrderItem>();
			for (int i=0; i<arr.size(); i++) {
				JsonObject o = arr.get(i).getAsJsonObject();
				oi = new OrderItem();
				oi.setQuantity(o.get("qnt").getAsInt());
				oi.setItem(itemManager.get(o.get("id").getAsLong(), true));
				orderItemList.add(oi);
			}
			
			to.setOrderItemList(orderItemList);
			to.setCustomerName( (String) pMap.get("firstname") + " " + (String) pMap.get("lastname"));
			to.setPhoneNumber((String) pMap.get("telephone"));
			to.setComment( (String) pMap.get("comment"));
			toManager.add(to);
			if (!pMap.get("email").equals(""))
				SendMailTLS.sendTakeawayEmail(pMap);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");	
		}
	}
	
	private void analyzeParameters(Map<String, String[]> paramMap, HttpServletRequest request, Map<String, Object> extrMap) {

		if (paramMap.containsKey("cart")) {
			String cart = (String) request.getParameter("cart");
			extrMap.put("cart", cart);
		}
		
		if (paramMap.containsKey("tot")) {
			float tot = Float.parseFloat(request.getParameter("tot"));
			extrMap.put("tot", tot);
		}
		
		if (paramMap.containsKey("firstname")) {
			String fn = (String) request.getParameter("firstname");
			extrMap.put("firstname", fn);
		}

		if (paramMap.containsKey("lastname")) {
			String ln = (String) request.getParameter("lastname");
			extrMap.put("lastname", ln);
		}

		if (paramMap.containsKey("email")) {
			String pValue = (String) request.getParameter("email");
			if (Validator.validateEmail(pValue) || pValue == "") {
				extrMap.put("email", pValue);
			} else {
				System.out.println("Invalid email");
			}
		}

		if (paramMap.containsKey("title")) {
			String t = (String) request.getParameter("title");
			extrMap.put("title", t);
		}

		if (paramMap.containsKey("address")) {
			String add = (String) request.getParameter("address");
			extrMap.put("address", add);
		}

		if (paramMap.containsKey("telephone")) {
			String tel = (String) request.getParameter("telephone");
			extrMap.put("telephone", tel);
		}

		if (paramMap.containsKey("comment")) {
			String comm = (String) request.getParameter("comment");
			extrMap.put("comment", comm);
		}

		if (paramMap.containsKey("session")) {
			String session = (String) request.getParameter("session");
			extrMap.put("session", session);
		}
	}
}
