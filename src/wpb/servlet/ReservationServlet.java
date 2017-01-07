package wpb.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import wpb.util.HibernateUtil;
import wpb.util.Validator;
import wpb.entity.FoodClass;
import wpb.entity.Item;
import wpb.entity.Reservation;
import wpb.entity.User;
import wpb.entity.RoomTable;
import wpb.manager.GenericManager;

@WebServlet(name = "ReservationServlet", urlPatterns = "/reservation")
public class ReservationServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	SimpleDateFormat FMT = new SimpleDateFormat("EEE, dd MMM yyyy");
	Reservation res = new Reservation();
	User user = new User();
	RoomTable table = new RoomTable();
	private static GenericManager<Reservation, Long> resManager = null;
	private static GenericManager<RoomTable, Long> rtManager = null;

	public void init() throws ServletException {
		resManager = new GenericManager<Reservation, Long>(Reservation.class, HibernateUtil.getSessionJavaConfigFactory());
		rtManager = new GenericManager<RoomTable, Long>(RoomTable.class, HibernateUtil.getSessionJavaConfigFactory());
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
		JsonArray result = (JsonArray) new Gson().toJsonTree(resManager.getAll());
		
		if (paramMap.containsKey("action")) {
			String action = (String) request.getParameter("action");
			
			if (action.equals("list")) {
				
				
				//JsonArray resu = (JsonArray) new Gson().toJsonTree(resManager.getAll());
				
				
				System.out.println(result);
				//System.out.println(resManager.get((long) 99, true));
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				try (PrintWriter out = response.getWriter()) {
					out.println(result.toString());
				}
			}
		}

		else {
			

			analyzeParameters(paramMap, request, pMap, errList);

			request.setAttribute("map", pMap);
			request.setAttribute("todayDate", FMT.format(new Date()));

			System.out.println(pMap);

			String title = request.getParameter("title");
			String fn = request.getParameter("firstname");
			String ln = request.getParameter("lastname");

			user.setFullName(title + " " + fn + " " + ln);
			user.setEmail(request.getParameter("email"));
			if (pMap.containsKey("telephone"))
				user.setPhoneNumber(request.getParameter("telephone"));
			user.setPassword("password");

			res.setGuest(user);

			// table.setSeats(Integer.parseInt(request.getParameter("guests")));

			String date = request.getParameter("date");
			String time = request.getParameter("time");

			try {
				SimpleDateFormat dateFormat = new SimpleDateFormat("EEE, dd MMM yyyy hh:mm");
				Date parsedDate = dateFormat.parse(date + " " + time);
				Timestamp start = new Timestamp(parsedDate.getTime());
				res.setStartDate(start);

				Calendar cal = Calendar.getInstance();
				cal.setTime(start);
				cal.add(Calendar.HOUR_OF_DAY, 2);
				Timestamp end = new Timestamp(cal.getTime().getTime());

				res.setEndDate(end);
				Set<RoomTable> tableList = new HashSet<RoomTable>();
				
				RoomTable rt = new RoomTable();
				rt.setName("Table 221");
				
				rt.setRoom("Room " + (int) Math.floor(Math.random() * 3));
				rt.setCategory(RoomTable.CategoryType.medium);
				tableList.add(rt);
				
				res.setTableList(tableList);
			} catch (Exception e) {
				e.getMessage();
			}
			System.out.println(res.toString());
			//resManager.add(res);
			request.getRequestDispatcher("pages/customer/reservationInvoice.jsp").forward(request, response);
		}

		
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
