package wpb.reservation;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

/**
 * Servlet implementation class ReservationServlet
 */
@WebServlet("/ReservationServlet")
public class ReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.getWriter().append(request.getParameter("firstname"));
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Map<String, String[]> paramMap = request.getParameterMap();
		Map<String, Object> pMap = new HashMap<String, Object>();
		List<HashMap<String, String>> errList = new ArrayList<HashMap<String, String>>();

		analyzeParameters(paramMap, request, pMap, errList);
		
		request.setAttribute("map", pMap);
		
		System.out.println(pMap);
		request.getRequestDispatcher("pages/customer/reservationInvoice.jsp").forward(request, response);
		
		doGet(request, response);

	}
	
	
	private void analyzeParameters(Map<String, String[]> paramMap, HttpServletRequest request, Map<String, Object> extrMap, List<HashMap<String, String>> errList) {

    	// in this method we should also create a structure with the errors
    	// and then check if the error-structure is not empty send back the
    	// first error message (or maybe all?) to the ajax function 	
        
		//SimpleDateFormat format = new SimpleDateFormat("EEEE, dd MMMM yyyy");
    	// try to parse dates
        if (paramMap.containsKey("date")) {
            String d = (String) request.getParameter("date");
            //Date date = Validator.parseDate(d);
            //if (date != null) {
                extrMap.put("date", d);
            //} else	{
            	//addError("dep", "Missing or unparseable departure date", errList);
        	//}
        }
        
        // parse flight info
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
            if (Validator.validateEmail(pValue)) {
                extrMap.put("email", pValue);
            } else {
            	//addError("email", "Missing or invalid email", errList);
            }
        }

    }

}
