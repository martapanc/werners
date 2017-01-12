package wpb.entity;

import java.lang.reflect.Type;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonSerializationContext;
import com.google.gson.JsonSerializer;

import wpb.manager.GenericManager;
import wpb.manager.RoomTableManager;
import wpb.util.HibernateUtil;
import wpb.util.TimestampUtils;

public class ResTest {

	private static GenericManager<Reservation, Long> resManager = null;
	private static RoomTableManager rtManager = null;
	

	public static void main(String[] args) throws ParseException {
		resManager = new GenericManager<Reservation, Long>(Reservation.class,
				HibernateUtil.getSessionJavaConfigFactory());
		rtManager = new RoomTableManager(HibernateUtil.getSessionJavaConfigFactory());
		
		SimpleDateFormat FMT = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
		FMT.setTimeZone(TimeZone.getTimeZone("GMT+1:00"));
		List<RoomTable> fitTables = rtManager.findSuitableTables(1);
		
		RoomTable rt = fitTables.get(0);
		// System.out.println("fit tables: " + fitTables.toString() + " \nFirst
		// fit:" + fitTables.get(0));
		JsonArray result = new JsonArray();
		Date test1, test2;

		test1 = FMT.parse("2017-01-11T20:00:00Z");
		test2 = FMT.parse("2017-01-11T22:00:00Z");

		result = serializeReservations(resManager.findAll());
		System.out.println(result.toString());
		List<RoomTable> avTables = fitTables;
		ArrayList<String> al = new ArrayList<String>();
		System.out.println("\nSub: " + fitTables.size() + " " + avTables.size());
		for (int i = 0; i < fitTables.size(); i++) {
			long index = fitTables.get(i).getId();
			System.out.println("fit id:" + index);
			for (int j = 0; j < result.size(); j++) {
				JsonObject o = result.get(j).getAsJsonObject();

				long objId = o.get("resourceId").getAsLong();
				if (objId == index) {
					System.out.println("\tobj: " + o.toString() + " o.resID: " + o.get("resourceId"));

					Date start = FMT.parse(o.get("start").getAsString());
					Date end = FMT.parse(o.get("end").getAsString());
					System.out.println(start + " " + test1 + " " + start.after(test1));
					if ((start.after(test1) && start.before(test2)) || start.compareTo(test1) == 0
							|| (end.after(test1) && end.before(test2))) {
						al.add((index-10) + "");
						fitTables.remove(i);
						
					}

				}
			}
		}

		System.out.println("\nAVAILABLE TABLES:" + avTables.toString());
		System.out.println("\nSub: " + fitTables.size() + " " + avTables.size());
		Date d = new Date(2017, 0, 9, 19, 45, 00);
		Date e = new Date(2017, 0, 7, 19, 45, 00);

		System.out.println(al.toString());

	}

	private static JsonArray serializeReservations(List<Reservation> resList) {

		GsonBuilder gsonBuilder = new GsonBuilder();

		JsonSerializer<Reservation> serializer = new JsonSerializer<Reservation>() {
			@Override
			public JsonElement serialize(Reservation res, Type typeOfSrc, JsonSerializationContext context) {
				JsonObject jsonObj = new JsonObject();

				String startDate = TimestampUtils.getISO8601String(res.getStartDate());
				String endDate = TimestampUtils.getISO8601String(res.getEndDate());

				String tag = res.getCustomerName();
				long id = res.getId();

				long resourceId = res.getRoomTable().getId();

				jsonObj.addProperty("start", startDate);
				jsonObj.addProperty("end", endDate);
				jsonObj.addProperty("resourceId", resourceId);
				jsonObj.addProperty("title", tag);
				jsonObj.addProperty("id", id);
				return jsonObj;
			}
		};

		gsonBuilder.registerTypeAdapter(Reservation.class, serializer);
		Gson customGson = gsonBuilder.create();
		JsonArray arr = (JsonArray) customGson.toJsonTree(resList);
		return arr;
	}
}