package wpb.takeawayorder;

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

import wpb.GenericManager;
import wpb.HibernateUtil;
import wpb.foodclass.FoodClass;
import wpb.item.Item;

import org.apache.commons.validator.routines.EmailValidator;

/**
 * Servlet implementation class TakeawayServlet
 */
@WebServlet("/TakeawayServlet")
public class TakeawayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static GenericManager<TakeawayOrder, Long> taManager = null;
	
	private static Gson gson = null;

	@Override
	public void init() throws ServletException {

		taManager = new GenericManager<TakeawayOrder, Long>(TakeawayOrder.class, HibernateUtil.getSessionJavaConfigFactory());
		gson = new GsonBuilder().create();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
		String cartStr = (String) request.getParameter("cart");
		String dataStr = (String) request.getParameter("data");
		JsonParser parser = new JsonParser();
		JsonObject data = parser.parse(dataStr).getAsJsonObject();		
		JsonArray cart = parser.parse(cartStr).getAsJsonArray();		
		
		try {
			TakeawayOrder order = new TakeawayOrder();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		//if (!errList.isEmpty()) {
			//String json = new Gson().toJson(errList);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			System.out.println(data.get("title") + " - " + cart.get(0));
			response.getWriter().write(dataStr);
			
			PrintWriter out = response.getWriter();
			//out.println(paramMap);
		/*} else {
			request.setAttribute("map", pMap);
			request.getRequestDispatcher("pages/customer/takeawayInvoice.jsp").forward(request, response);
		}*/
	}

	

}
