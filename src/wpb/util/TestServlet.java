package wpb.util;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.*;

import wpb.entity.FoodClass;
import wpb.entity.Item;
import wpb.entity.Restaurant;
import wpb.manager.GenericManager;
import wpb.util.HibernateUtil;

/**
 * Servlet implementation class ItemServlet
 */
@WebServlet(name = "testServlet", urlPatterns = "/test", loadOnStartup = 1)
public class TestServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private static GenericManager<Item, Long> itmManager = null;
	private static GenericManager<FoodClass, Long> fcManager = null;
	private static Gson gson = null;
	
	@Override
	public void init() throws ServletException {
		gson = new GsonBuilder().create();
		itmManager = new GenericManager<Item, Long>(Item.class, HibernateUtil.getSessionJavaConfigFactory());
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
			String data = (String) request.getParameter("data");
			switch (action) {

			case "get": {
			}
				Restaurant beanItm = itmManager.find(Long.parseLong(data), true);
				request.setAttribute("itm", beanItm);
				request.getRequestDispatcher("/WEB-INF/test.jsp").forward(request, response);
			}
		}
	}
}
