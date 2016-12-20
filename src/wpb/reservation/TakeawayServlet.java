package wpb.reservation;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.*;

/**
 * Servlet implementation class TakeawayServlet
 */
@WebServlet("/TakeawayServlet")
public class TakeawayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TakeawayServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String cartStr = "";
		cartStr = request.getParameter("cart"); //get cart content from request as string
		JsonParser parser = new JsonParser(); //parse string as object {jcart: [{...}]} and get Json array
		JsonArray jcart = parser.parse(cartStr).getAsJsonObject().get("jcart").getAsJsonArray();
		Gson gson = new Gson();
		Wrapper[] arr = gson.fromJson(jcart, Wrapper[].class); //Store data to custom array
		
		
		
		for (int i = 0; i < arr.length; i++)
			System.out.println(arr[i].name + " " + arr[i].qnt + " " + arr[i].totPrice + " " + arr[i].uPrice);
		
		request.setAttribute("arr", arr);
		 
		//response.getWriter().append(jcart.toString());
		
		PrintWriter out = response.getWriter();
	    out.println(jcart.toString());
		
	    System.out.println(jcart.toString());
		//PrintWriter pw = new PrintWriter();
		
		//pw.append(arr);
		
		//request.getRequestDispatcher("pages/customer/reservationInvoice.jsp").forward(request, response);
		doGet(request,response);
	}

}


