package wpb.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.ParseException;
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
import wpb.entity.Role;
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
	private static GenericManager<User, Long> usrManager = null;
	Calendar cal = Calendar.getInstance();

	public void init() throws ServletException {
		resManager = new GenericManager<Reservation, Long>(Reservation.class,
				HibernateUtil.getSessionJavaConfigFactory());
		rtManager = new GenericManager<RoomTable, Long>(RoomTable.class, HibernateUtil.getSessionJavaConfigFactory());
		usrManager = new GenericManager<User, Long>(User.class, HibernateUtil.getSessionJavaConfigFactory());
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

		if (paramMap.containsKey("action")) {
			String action = (String) request.getParameter("action");

			if (action.equals("list")) {
				JsonArray result = (JsonArray) new Gson().toJsonTree(resManager.getAll());
				System.out.println(resManager.getAll());
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
			
			String idStr = request.getParameter("session");
			if (!idStr.equals("")) {
				Long id= Long.parseLong(request.getParameter("session"));
				res.setUser(usrManager.get(id, true));
				System.out.println("internal");
			}
			else {
				System.out.println("external");
				User newUser = new User();
				newUser.setAvatar("/restaurantProject/dist/img/gusteau160x160.jpg");
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
				usrManager.add(newUser);
			}
			
			String date = request.getParameter("date");
			System.out.println(date);
			String time = request.getParameter("time");

			// SimpleDateFormat dateFormat = new SimpleDateFormat("EEE, dd MMM yyyy HH:mm");
			SimpleDateFormat dateFormat = new SimpleDateFormat("dd MMM yyyy HH:mm");
			Date parsedDate;
			try {
				parsedDate = dateFormat.parse(date + " " + time);
				Timestamp start = new Timestamp(parsedDate.getTime());
				res.setStartDate(start);
				System.out.println(parsedDate);
				cal.setTime(start);
				cal.add(Calendar.HOUR_OF_DAY, 2);
				Timestamp end = new Timestamp(cal.getTime().getTime());
				res.setEndDate(end);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			Set<RoomTable> tableList = new HashSet<RoomTable>();
			RoomTable rt = new RoomTable();
			rt.setSeats((int) pMap.get("guests"));
			
			List<RoomTable> fitTables = rtManager.getAllByExample(rt);
			List<RoomTable> firstTable = new ArrayList<RoomTable>();
			firstTable.add(fitTables.get(0));
			res.setTableList(tableList);
			res.setComment(request.getParameter("comment"));
			res.setCustomerName(request.getParameter("firstname") + " " + request.getParameter("lastname"));
			res.setTableList(tableList);
			
			resManager.add(res);
			System.out.println(res.toString());
			if (!idStr.equals("")) {
				request.getRequestDispatcher("pages/customer/reservationInvoice.jsp").forward(request, response);
			}
			else  request.getRequestDispatcher("pages/home/reservation-invoice.jsp").forward(request, response);
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
			int guests = Integer.parseInt(request.getParameter("guests"));
			extrMap.put("guests", guests);
		}

		if (paramMap.containsKey("telephone")) {
			String tel = (String) request.getParameter("telephone");
			extrMap.put("telephone", tel);
		}

	}

}
