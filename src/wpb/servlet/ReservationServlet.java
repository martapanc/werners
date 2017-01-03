package wpb.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import wpb.util.Validator;

@WebServlet(name = "ReservationServlet", urlPatterns = "/ReservationServlet")
public class ReservationServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	SimpleDateFormat FMT = new SimpleDateFormat("EEE, dd MMM yyyy");

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Map<String, String[]> paramMap = request.getParameterMap();
		Map<String, Object> pMap = new HashMap<String, Object>();
		List<HashMap<String, String>> errList = new ArrayList<HashMap<String, String>>();

		analyzeParameters(paramMap, request, pMap, errList);

		request.setAttribute("map", pMap);
		request.setAttribute("todayDate", FMT.format(new Date()));

		System.out.println(pMap);
		request.getRequestDispatcher("pages/customer/reservationInvoice.jsp").forward(request, response);
	}

	private void analyzeParameters(Map<String, String[]> paramMap, HttpServletRequest request,
			Map<String, Object> extrMap, List<HashMap<String, String>> errList) {

		// try to parse dates
		if (paramMap.containsKey("date")) {
			String d = (String) request.getParameter("date");
			extrMap.put("date", d);
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
			if (Validator.validateEmail(pValue)) {
				extrMap.put("email", pValue);
			} else {
				// addError("email", "Missing or invalid email", errList);
			}
		}

		if (paramMap.containsKey("title")) {
			String t = (String) request.getParameter("title");
			extrMap.put("title", t);
		}

		if (paramMap.containsKey("time")) {
			String time = (String) request.getParameter("time");
			extrMap.put("time", time);
		}

		if (paramMap.containsKey("guests")) {
			String guests = (String) request.getParameter("guests");
			extrMap.put("guests", guests);
		}

		if (paramMap.containsKey("telephone")) {
			String tel = (String) request.getParameter("telephone");
			extrMap.put("telephone", tel);
		}

	}

}
