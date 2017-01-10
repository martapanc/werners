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

@WebServlet(name = "TakeawayServlet", urlPatterns = "/takeaway")
public class TakeawayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static GenericManager<TakeawayOrder, Long> toManager = null;
	private static GenericManager<OrderItem, Long> oiManager = null;
	private static GenericManager<User, Long> userManager = null;
	private static GenericManager<Item,Long> itemManager = null;
	User user = new User();
	Calendar cal = Calendar.getInstance();
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
		
		//System.out.println("address: " + request.getParameter("address"));
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

			String idStr = request.getParameter("session");
			if (!idStr.equals("")) {
				Long id= Long.parseLong(idStr);
				to.setGuest(userManager.get(id, true));
				System.out.println("internal");
			}
			else {
				System.out.println("external");
				User newUser = new User();
				newUser.setAvatar("dist/img/gusteau160x160.jpg");
				cal.setTime(new Date());
				Timestamp ts = new Timestamp(cal.getTime().getTime());
				newUser.setCreationDate(ts);
				newUser.setEmail(request.getParameter("email"));
				newUser.setFullName(request.getParameter("firstname") + " " + request.getParameter("lastname"));
				newUser.setPassword("password");
				newUser.setPhoneNumber(request.getParameter("telephone"));
				Role role = new Role();
				role.setName(Role.RoleEnum.CUSTOMER);
				newUser.setRole(role);
				newUser.setVersionNumber(0);
				userManager.add(newUser);
			}
			//Long id = Long.parseLong(request.getParameter("session"));
			//to.setGuest(userManager.get(id, true));
			Timestamp ts1 = new Timestamp(cal.getTime().getTime());
			to.setOrderDate(ts1);
			to.setAddress(request.getParameter("address"));
			to.setCost(Float.parseFloat(request.getParameter("tot")));
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
			to.setCustomerName(request.getParameter("firstname") + " " + request.getParameter("lastname"));
			to.setPhoneNumber(request.getParameter("telephone"));
			to.setComment(request.getParameter("comment"));
			toManager.add(to);
			
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");	
			PrintWriter out = response.getWriter();
			out.println("ok");
		}
	}
}
