package wpb.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Type;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TimeZone;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonSerializationContext;
import com.google.gson.JsonSerializer;

import wpb.entity.*;
import wpb.manager.*;
import wpb.util.HibernateUtil;
import wpb.util.StopWatch;
import wpb.util.TimestampUtils;
import wpb.util.Validator;

@WebServlet(name = "ReservationServlet", urlPatterns = "/reservation")
public class ReservationServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	SimpleDateFormat FMT = new SimpleDateFormat("EEE, dd MMM yyyy");
	Reservation res = new Reservation();
	private static GenericManager<Reservation, Long> resManager = null;
	private static RoomTableManager rtManager = null;
	private static GenericManager<User, Long> usrManager = null;

	public void init() throws ServletException {
		resManager = new GenericManager<Reservation, Long>(Reservation.class,
				HibernateUtil.getSessionJavaConfigFactory());
		rtManager = new RoomTableManager(HibernateUtil.getSessionJavaConfigFactory());
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
			JsonArray result;
			switch (action) {
			case "list": {
				result = (JsonArray) new Gson().toJsonTree(resManager.findAll());
				System.out.println(resManager.findAll());
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				try (PrintWriter out = response.getWriter()) {
					out.println(result.toString());
				}
				break;
			}

			case "listForScheduler": {
				result = serializeReservations(resManager.findAll());
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				try (PrintWriter out = response.getWriter()) {
					out.println(result.toString());
				}
				break;
			}
			}
		}

		else {

			analyzeParameters(paramMap, request, pMap, errList);
			request.setAttribute("map", pMap);
			request.setAttribute("todayDate", FMT.format(new Date()));
			res.setCustomerName(pMap.get("firstname") + " " + pMap.get("lastname"));
			res.setComment(pMap.get("comment").toString());
			String idStr = (String) pMap.get("session");
			if (!idStr.equals("")) {
				Long id = Long.parseLong(idStr);
				res.setUser(usrManager.get(id, true));
			}

			Timestamp start = (Timestamp) pMap.get("start");
			Timestamp end = (Timestamp) pMap.get("end");
			res.setStartDate(start);
			res.setEndDate(end);
			List<RoomTable> fitTables;
			try {
				fitTables = findAvailableTables(start, end, (int) pMap.get("guests"));
				if (!fitTables.isEmpty()) {
					RoomTable rt = fitTables.get(0); // The first room table in the list is the table with the smallest num of seats
					res.setRoomTable(rt);
					resManager.add(res);
					if (!idStr.equals("")) {
						request.getRequestDispatcher("pages/customer/reservationInvoice.jsp").forward(request, response);
					} else {
						request.getRequestDispatcher("pages/home/reservation-invoice.jsp").forward(request, response);
					}
				} else {
					request.setAttribute("reservationError", "Sorry, no places available at chosen time. "
							+ "Please choose a different start time for your reservation");
					if (!idStr.equals("")) {
						request.getRequestDispatcher("pages/customer/tableReservation.jsp").forward(request, response);
					} else {
						request.getRequestDispatcher("pages/home/table-reservation.jsp").forward(request, response);
						System.out.println("Restaurant full in selected time slot - or no tables with x+ seats available");
					}
				}

			} catch (ParseException e) {
				e.printStackTrace();
			}
		}

	}

	private void analyzeParameters(Map<String, String[]> paramMap, HttpServletRequest request,
			Map<String, Object> extrMap, List<HashMap<String, String>> errList) {

		if (paramMap.containsKey("date") && paramMap.containsKey("time")) {
			Calendar cal = Calendar.getInstance();
			SimpleDateFormat dateFormat = new SimpleDateFormat("dd MMM yyyy HH:mm");
			Date parsedDate;
			try {
				String date = request.getParameter("date");
				String time = request.getParameter("time");
				parsedDate = dateFormat.parse(date + " " + time);
				Timestamp start = new Timestamp(parsedDate.getTime());
				cal.setTime(start);
				cal.add(Calendar.HOUR_OF_DAY, 2);
				Timestamp end = new Timestamp(cal.getTime().getTime());
				extrMap.put("start", start);
				extrMap.put("end", end);

			} catch (Exception e) {
				e.printStackTrace();
			}
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
				System.out.println("Invalid email");
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

		if (paramMap.containsKey("comment")) {
			String comm = (String) request.getParameter("comment");
			extrMap.put("comment", comm);
		}

		if (paramMap.containsKey("session")) {
			String session = (String) request.getParameter("session");
			extrMap.put("session", session);
		}
	}

	/**
	 * Converts a list of reservations into a JSONarray according to what the
	 * scheduler plugin expects
	 * 
	 * @return
	 */
	private JsonArray serializeReservations(List<Reservation> resList) {

		GsonBuilder gsonBuilder = new GsonBuilder();

		JsonSerializer<Reservation> serializer = new JsonSerializer<Reservation>() {
			@Override
			public JsonElement serialize(Reservation res, Type typeOfSrc, JsonSerializationContext context) {
				JsonObject jsonObj = new JsonObject();
				String startDate = TimestampUtils.getISO8601String(res.getStartDate());
				String endDate = TimestampUtils.getISO8601String(res.getEndDate());
				String tag = res.getCustomerName();
				RoomTable r = res.getRoomTable();
				int seats = r.getSeats();
				long id = res.getId();
				long resourceId = res.getRoomTable().getId();
				jsonObj.addProperty("start", startDate);
				jsonObj.addProperty("end", endDate);
				jsonObj.addProperty("resourceId", resourceId);
				jsonObj.addProperty("title", tag + "  [" + seats + "]");
				jsonObj.addProperty("id", id);
				System.out.println(jsonObj);
				return jsonObj;
			}
		};

		gsonBuilder.registerTypeAdapter(Reservation.class, serializer);
		Gson customGson = gsonBuilder.create();
		JsonArray arr = (JsonArray) customGson.toJsonTree(resList);
		return arr;
	}

	private List<RoomTable> findAvailableTables(Date resStart, Date resEnd, int guests) throws ParseException {
		SimpleDateFormat FMT = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
		FMT.setTimeZone(TimeZone.getTimeZone("GMT+1:00"));
		List<RoomTable> fitTables = rtManager.findSuitableTables(guests); // Get all tables
		JsonArray result = serializeReservations(resManager.findAll()); // Get existing reservations
		List<RoomTable> avTables = fitTables;
		ArrayList<Long> al = new ArrayList<Long>();
		for (int i = 0; i < fitTables.size(); i++) {
			long index = fitTables.get(i).getId();
			for (int j = 0; j < result.size(); j++) {
				JsonObject o = result.get(j).getAsJsonObject();
				long objId = o.get("resourceId").getAsLong();
				if (objId == index) { // Search for reservations associated to tables
					Date start = FMT.parse(o.get("start").getAsString());
					Date end = FMT.parse(o.get("end").getAsString());
					// A 2-hour time slot is available for a new reservation if
					// there are no existing reservation overlapping it
					if ((start.after(resStart) && start.before(resEnd)) || start.compareTo(resStart) == 0
							|| (end.after(resStart) && end.before(resEnd))) {
						al.add(index); // Create a list of the table indices that are not available
					}
				}
			}
		}

		ArrayList<RoomTable> toDelete = new ArrayList<RoomTable>();
		for (int k = 0; k < fitTables.size(); k++) {
			long id = fitTables.get(k).getId();
			if (al.contains(id))
				toDelete.add(avTables.get(k));
		}
		// Remove occupied tables from the "Available tables" list
		for (RoomTable del : toDelete)
			avTables.remove(del);
		return avTables;
	}
}
