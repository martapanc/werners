package wpb.util;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import wpb.entity.FoodClass;
import wpb.entity.User;
import wpb.manager.FoodClassManager;
import wpb.manager.RoomTableManager;
import wpb.manager.UserManager;

public class Test {

	public static void main(String[] args) {
		
		RoomTableManager resManager = new RoomTableManager(HibernateUtil.getSessionJavaConfigFactory());
		
		/*
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd MMM yyyy HH:mm");
		DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");
		Date date = dateFormat.parse("2017-01-08 17:45:00");
		long time = date.getTime();
		new Timestamp(time);
		*/
		
		
		Timestamp startDate = java.sql.Timestamp.valueOf("2017-01-12 17:00:00");
		Timestamp endDate= java.sql.Timestamp.valueOf("2017-01-12 19:00:00");
		
		System.out.println(resManager.findFreeRoomTables(12, startDate, endDate));
		
		FoodClassManager fcManager = new FoodClassManager(HibernateUtil.getSessionJavaConfigFactory());
		FoodClass c = fcManager.getByName("Pizza");
		
		System.out.println(c);
		
		UserManager userManager = new UserManager(HibernateUtil.getSessionJavaConfigFactory());
		User user = userManager.getByEmailPassword("marta@wpb.it", "marta");
		
		System.out.println(user);
	}

}
